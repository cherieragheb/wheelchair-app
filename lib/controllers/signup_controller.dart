import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tom/common/types/gender.dart';
import 'package:tom/common/types/user.dart';
import 'package:tom/controllers/location_controller.dart';
import 'package:tom/controllers/user_controller.dart';
import 'package:tom/models/user_model.dart';
import 'package:tom/nav_menu.dart';
import 'package:tom/utils/snackbar.dart';
import 'package:tom/views/places/init_place_screen.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final db = FirebaseFirestore.instance;
  final locCtrl = LocationController.instance;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final userType = UserType.wheelchair.obs;

  Future<void> registerUser() async {
    EasyLoading.show(status: 'loading...');
    try {
      // validate form
      if (!formkey.currentState!.validate()) {
        CustomSnackbar.warningSnackbar(
          message: 'Please make sure you enter valid info.',
        );
        return;
      }

      // create user
      final userCred =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      if (userCred.user == null) {
        CustomSnackbar.errorSnackbar();
        EasyLoading.dismiss();
        return;
      }
      // check user type
      final UserModel user = UserModel(
        id: userCred.user!.uid,
        firstName: firstName.text,
        lastName: lastName.text,
        email: email.text,
        phoneNumber: phoneNumber.text,
        password: password.text,
        gender: Gender.male,
        userType: userType.value,
        location: locCtrl.currentLocation,
        rateCount: 0,
        avgRate: 0.0,
      );
      // add user to firestore
      await db.collection('Users').doc(user.id).set(user.toMap());
      // set current user
      UserController.instance.currrentUser = user;
      // success messege
      CustomSnackbar.successSnackbar(message: 'Your account has been created.');
      EasyLoading.dismiss();
      // go to next screen
      if (user.userType == UserType.provider) {
        Get.offAll(() => const InitialPlaceAddScreen());
      } else {
        Get.offAll(() => const NavMenu());
      }
    } catch (e) {
      CustomSnackbar.errorSnackbar(message: e.toString());
      EasyLoading.dismiss();
    }
  }
}
