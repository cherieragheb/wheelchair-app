import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  static void errorSnackbar({String? message}) {
    Get.showSnackbar(GetSnackBar(
      title: "Error ❗",
      message: message ?? "Something went wrong.",
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red[900]!,
      borderRadius: 3,
    ));
  }

  static void successSnackbar({required String message}) {
    Get.showSnackbar(GetSnackBar(
      title: 'Success ✅',
      message: message,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.green[900]!,
      borderRadius: 3,
    ));
  }

  static void warningSnackbar({required String message}) {
    Get.showSnackbar(GetSnackBar(
      title: "Warning ⚠️",
      message: message,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.amber[900]!,
      borderRadius: 3,
    ));
  }
}
