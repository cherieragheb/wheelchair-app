import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tom/common/themes/colors.dart';
import 'package:tom/common/types/category.dart';
import 'package:tom/controllers/user_controller.dart';
import 'package:tom/views/places/places_screen.dart';
import 'package:tom/views/volunteers/volunteers_screen.dart';

class WheelChairHomeScreen extends StatelessWidget {
  const WheelChairHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: MyColors.primary,
          title: Row(
            children: [
              const CircleAvatar(
                radius: 30,
                foregroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  UserController.instance.currrentUser.fullName,
                  style: TextStyle(
                      color: MyColors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              height: 100,
              width: 345,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VolunteersSceen()));
                    },
                    child: Text(
                      'Request Voulnteer',
                      style: TextStyle(color: MyColors.black),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  const Image(image: AssetImage('assets/images/voulnteer.jpg')),
                ],
              ),
            ),
            Expanded(
              child: GridView(
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: placeCategoryData
                      .map(
                        (category) => Card(
                          color: const Color.fromARGB(189, 238, 238, 238),
                          child: SizedBox(
                            height: 15,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  category.icon,
                                  size: 40,
                                  color: MyColors.black,
                                ),
                                TextButton(
                                    onPressed: () => Get.to(() => PlacesScreen(
                                        title: category.name,
                                        category: category.category)),
                                    child: Text(
                                      category.name,
                                      style: TextStyle(
                                          color: MyColors.black, fontSize: 25),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList()),
            )
          ]),
        ));
  }
}
