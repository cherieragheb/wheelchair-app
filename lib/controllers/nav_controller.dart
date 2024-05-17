import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tom/common/types/user.dart';
import 'package:tom/controllers/user_controller.dart';
import 'package:tom/views/home/custom/provider_home_screen.dart';
import 'package:tom/views/home/custom/volunteer_home_screen.dart';
import 'package:tom/views/home/custom/wheelchair_home_screen.dart';
import 'package:tom/views/home/map_screen.dart';
import 'package:tom/views/home/setting_screen.dart';

class NavController extends GetxController {
  static NavController get instance => Get.find();
  final PageController pageController = PageController();
  final pageIndex = 0.obs;

  final userController = UserController.instance;

  List<Widget> userSpecificWidgets() {
    if (kDebugMode) {
      print(
          "===User Type Identfied successfuly: ${userController.currrentUser.userType}===");
    }
    return [
      const MapScreen(),
      if (userController.currrentUser.userType == UserType.volunteer)
        const VolunteerHomeScreen()
      else if (userController.currrentUser.userType == UserType.provider)
        const ProviderHomeScreen()
      else if (userController.currrentUser.userType == UserType.wheelchair)
        const WheelChairHomeScreen(),
      const SettingsScreen(),
    ];
  }

  void onChangePage(int index) {
    pageIndex.value = index;
    pageController.jumpToPage(index);
  }
}
