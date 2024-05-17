import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tom/common/themes/colors.dart';
import 'package:tom/controllers/nav_controller.dart';

class NavMenu extends StatelessWidget {
  const NavMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NavController.instance;
    return Obx(() => Scaffold(
          body: PageView(
            // index: controller.pageIndex.value,
            // preloadIndexes: const [0],
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) => controller.onChangePage(value),
            controller: controller.pageController,
            children: controller.userSpecificWidgets(),
          ),
          bottomNavigationBar: NavigationBar(
            elevation: 0,
            backgroundColor: MyColors.accent,
            selectedIndex: controller.pageIndex.value,
            onDestinationSelected: (value) => controller.onChangePage(value),
            height: 60,
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.map_outlined),
                  selectedIcon: Icon(Icons.map),
                  label: "Map"),
              NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  selectedIcon: Icon(Icons.home),
                  label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.settings),
                  selectedIcon: Icon(Icons.settings),
                  label: "Setting"),
            ],
          ),
        ));
  }
}
