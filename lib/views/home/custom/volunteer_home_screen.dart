import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tom/common/themes/colors.dart';
import 'package:tom/controllers/user_controller.dart';
import 'package:tom/views/volunteers/requests_screen.dart';

class VolunteerHomeScreen extends StatelessWidget {
  const VolunteerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.25, 0.25],
          colors: [
            MyColors.primary,
            MyColors.white,
          ],
        )),
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                    child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                    Column(children: [
                      const CircleAvatar(
                        maxRadius: 70,
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          controller.currrentUser.fullName,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ]),
                    Container(
                      height: 65,
                      width: 320,
                      decoration: BoxDecoration(
                        border: Border.all(color: MyColors.black),
                        borderRadius: BorderRadius.circular(20),
                        color: MyColors.white,
                      ),
                      child: TextButton(
                          onPressed: () => Get.to(() => const RequestsScreen()),
                          child: Text(
                            'Requests',
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
                          onPressed: () {},
                          child: Text(
                            'Chats',
                            style: TextStyle(
                                color: MyColors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                  ],
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
