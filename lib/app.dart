import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:tom/controllers/location_controller.dart';
import 'package:tom/controllers/nav_controller.dart';
import 'package:tom/controllers/place_controller.dart';
import 'package:tom/controllers/reviews_controller.dart';
// import 'package:tom/controllers/test_controller.dart';
import 'package:tom/controllers/user_controller.dart';
import 'package:tom/views/auth/onboarding_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBindings(),
      home: const OnboardingScreen(),
      builder: EasyLoading.init(),
    );
  }
}

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    // Get.put<TestController>(TestController());
    Get.put<ReviewsController>(ReviewsController());
    Get.put<UserController>(UserController());
    Get.put<LocationController>(LocationController());
    Get.put<PlaceController>(PlaceController());
    Get.put<NavController>(NavController());
  }
}
