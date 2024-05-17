import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tom/common/themes/colors.dart';
import 'package:tom/common/widgets/avatar_header.dart';
import 'package:tom/controllers/user_controller.dart';
import 'package:tom/views/places/edit_place_screen.dart';
import 'package:tom/views/places/places_screen.dart';

class ProviderHomeScreen extends StatelessWidget {
  const ProviderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.25, 0.25],
            colors: [
              MyColors.primary,
              MyColors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            AvatarHeader(
              name: controller.currrentUser.fullName,
              image: 'assets/images/profile.jpg',
            ),
            Container(
              height: 65,
              width: 320,
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.black),
                borderRadius: BorderRadius.circular(20),
                color: MyColors.white,
              ),
              child: TextButton(
                  onPressed: () => Get.to(() => PlacesScreen(
                      title: "${controller.currrentUser.fullName}'s Places")),
                  child: Text(
                    'Places',
                    style: TextStyle(
                        color: MyColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Container(
              height: 65,
              width: 320,
              decoration: BoxDecoration(
                border: Border.all(color: MyColors.black),
                borderRadius: BorderRadius.circular(20),
                color: MyColors.white,
              ),
              child: TextButton(
                  onPressed: () => Get.to(() => const EditPlaceScreen()),
                  child: Text(
                    'Add New Place',
                    style: TextStyle(
                        color: MyColors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
