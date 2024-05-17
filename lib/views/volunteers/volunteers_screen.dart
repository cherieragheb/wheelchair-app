import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tom/common/themes/colors.dart';
import 'package:tom/common/widgets/volunteer_tile.dart';
import 'package:tom/controllers/user_controller.dart';
import 'package:tom/views/volunteers/volunteer_reviews_screen.dart.dart';

class VolunteersSceen extends StatelessWidget {
  const VolunteersSceen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        title: Text(
          'Request Help',
          style: TextStyle(color: MyColors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: controller.vUsers.length,
        itemBuilder: (context, int index) {
          return VolunteerTile(
            user: controller.vUsers[index],
            onTap: () =>
                Get.to(() => VolunteerReviewsScreen(controller.vUsers[index])),
          );
        },
      ),
    );
  }
}
