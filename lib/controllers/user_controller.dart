import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tom/common/types/user.dart';
import 'package:tom/models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final db = FirebaseFirestore.instance;

  final List<UserModel> users = <UserModel>[];
  List<UserModel> vUsers = <UserModel>[];
  UserModel currrentUser = UserModel.empty();

  @override
  void onReady() {
    loadUsers();
    super.onReady();
  }

  Future<void> updateCurrentUserById(String id) async {
    currrentUser = users.firstWhere((user) => user.id == id);
  }

  Future<void> loadUsers() async {
    // empty the list
    users.clear();
    try {
      // fetch data from database
      await db.collection('Users').get().then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          users.add(UserModel.fromMap(doc.data() as Map<String, dynamic>));
        }
      });
      vUsers =
          users.where((user) => user.userType == UserType.volunteer).toList();
      if (kDebugMode) print('===loaded ${users.length} users successfully===');
    } catch (e) {
      if (kDebugMode) print('===User Error ${e.toString()}===');
    }
  }
}
