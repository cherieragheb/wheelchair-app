import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class TestController extends GetxController {
  static TestController get instance => Get.find();

  final db = FirebaseFirestore.instance;

  @override
  void onReady() {
    doMyTest();
    super.onReady();
  }

  Future<void> doMyTest() async {
    // empty the list
    try {
      // fetch data from database
      final data = {'rateCount': 0, 'avgRate': 0.0};

      await db
          .collection('places')
          .get()
          .then((QuerySnapshot querySnapshot) async {
        for (var doc in querySnapshot.docs) {
          await db
              .collection('places')
              .doc(doc.id)
              .set(data, SetOptions(merge: true));
        }
      });
      if (kDebugMode) print('===Test Done===');
    } catch (e) {
      if (kDebugMode) print('===Test Error ${e.toString()}===');
    }
  }
}
