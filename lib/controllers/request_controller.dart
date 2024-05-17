import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tom/common/types/state.dart';
import 'package:tom/models/request_model.dart';
import 'package:tom/utils/snackbar.dart';
import 'package:uuid/uuid.dart';

class RequestController extends GetxController {
  static RequestController get instance => Get.find();

  final db = FirebaseFirestore.instance;

  final List<RequestModel> requests = <RequestModel>[];
  final filteredRequests = <RequestModel>[].obs;

  @override
  void onReady() {
    loadRequests();
    super.onReady();
  }

  Future<void> loadRequests() async {
    // empty the list
    requests.clear();
    filteredRequests.clear();
    try {
      // fetch data from database
      await db.collection('Requests').get().then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          requests
              .add(RequestModel.fromMap(doc.data() as Map<String, dynamic>));
        }
      });
      filteredRequests.assignAll(requests);
      if (kDebugMode) {
        print('===loaded ${requests.length} requests successfully===');
      }
    } catch (e) {
      if (kDebugMode) print('===Requests Error ${e.toString()}===');
    }
  }

  void updateFilterdRequests(String targetId) {
    filteredRequests.clear();
    filteredRequests.value =
        requests.where((review) => review.targetId == targetId).toList();
    if (kDebugMode) {
      print('===filtered ${filteredRequests.length} places successfully===');
    }
  }

  Future<void> addNewRequest(sourceId, targetId) async {
    EasyLoading.showProgress(
      0.3,
      status: 'Sending...',
      maskType: EasyLoadingMaskType.black,
    );
    final newRequest = RequestModel(
      id: const Uuid().v4(),
      targetId: targetId,
      sourceId: sourceId,
      rate: 0,
      timeStamp: DateTime.now(),
      state: RequestState.pending,
    );
    try {
      // add review tp database
      await db
          .collection('Requests')
          .doc(newRequest.id)
          .set(newRequest.toMap());
      // refresh list
      await loadRequests();
      updateFilterdRequests(sourceId);
      if (kDebugMode) print('===added new request successfully===');
      // success messege
      EasyLoading.showSuccess('Request Sent!');
    } catch (e) {
      EasyLoading.showError('Failed!');
      CustomSnackbar.errorSnackbar(message: e.toString());
    }
  }
}
