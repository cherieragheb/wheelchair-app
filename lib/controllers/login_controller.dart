import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tom/controllers/nav_controller.dart';
import 'package:tom/controllers/user_controller.dart';
import 'package:tom/models/user_model.dart';
import 'package:tom/nav_menu.dart';
import 'package:tom/utils/snackbar.dart';
import 'package:tom/views/auth/login_screen.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final isHidden = true.obs;

  Future<void> loginUser() async {
    EasyLoading.show(status: 'loading...');
    try {
      if (!formKey.currentState!.validate()) {
        CustomSnackbar.warningSnackbar(
            message: "Please make sure you enter valid info.");
        return;
      }
      // log in firebase
      final userCred = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      // updare user data
      if (userCred.user == null) {
        CustomSnackbar.errorSnackbar();
        return;
      } else {
        // update user data
        if (kDebugMode) {
          print('=== Log in fb successfully: ${userCred.user!.uid}===');
        }
        UserController.instance.updateCurrentUserById(userCred.user!.uid);
        // success message
        CustomSnackbar.successSnackbar(
            message: 'You are logged in successfully.');
        EasyLoading.dismiss();
        // move to next screen
        Get.off(() => const NavMenu());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomSnackbar.errorSnackbar(message: 'No user found for that email.');
        EasyLoading.dismiss();
      } else if (e.code == 'wrong-password') {
        CustomSnackbar.errorSnackbar(
            message: 'Wrong password provided for that user.');
        EasyLoading.dismiss();
      }
    } catch (e) {
      CustomSnackbar.errorSnackbar(message: e.toString());
      EasyLoading.dismiss();
    }
  }

  Future<void> logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
      UserController.instance.currrentUser = UserModel.empty();

      if (kDebugMode) {
        print('=== Log out successfully===');
      }
      // reset navigation
      NavController.instance.onChangePage(0);
      // success message
      CustomSnackbar.successSnackbar(
          message: 'You are logged in successfully.');
      EasyLoading.dismiss();

      Get.offAll(() => const LoginScreen());
    } catch (e) {
      CustomSnackbar.errorSnackbar(message: e.toString());
      EasyLoading.dismiss();
    }
  }
}
