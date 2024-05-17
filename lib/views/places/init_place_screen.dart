import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tom/common/themes/colors.dart';
import 'package:tom/common/types/category.dart';
import 'package:tom/common/widgets/custom_input_field.dart';
import 'package:tom/controllers/place_controller.dart';

class InitialPlaceAddScreen extends StatelessWidget {
  const InitialPlaceAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PlaceController());
    controller.setCurrentLocationInput();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ListTile(
                      title: Text(
                        'Place Information:',
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold),
                      ),
                    ),
                    CustomInputField(
                      controller: controller.title,
                      text: 'Place Name',
                      icon: Icons.home_work_sharp,
                    ),
                    Obx(() => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: MyColors.accent,
                        ),
                        child: DropdownButton<PlaceCategory>(
                            hint: const Text("Place type"),
                            value: controller.category.value,
                            isExpanded: true,
                            icon: const Icon(Icons.arrow_drop_down),
                            style: TextStyle(color: MyColors.white),
                            onChanged: (PlaceCategory? newvalue) =>
                                controller.category.value = newvalue!,
                            items: placeCategoryData
                                .map((category) =>
                                    DropdownMenuItem<PlaceCategory>(
                                      value: category.category,
                                      child: ListTile(
                                        leading: Icon(category.icon),
                                        title: Text(
                                          category.name,
                                          style:
                                              TextStyle(color: MyColors.black),
                                        ),
                                      ),
                                    ))
                                .toList()))),
                    CustomInputField(
                      controller: controller.location,
                      text: 'Location',
                      icon: Icons.location_on,
                      isDisabled: true,
                    ),
                    CustomInputField(
                      controller: controller.workHours,
                      text: 'Work time',
                      icon: Icons.timelapse,
                    ),
                    CustomInputField(
                      controller: controller.website,
                      text: 'Website',
                      icon: Icons.link,
                    ),
                    CustomInputField(
                      controller: controller.phoneNumber,
                      text: 'Phone Number',
                      icon: Icons.phone,
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * .99,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color.fromARGB(140, 92, 37, 141)),
                      child: TextButton(
                          onPressed: () => controller.addNewPlace(),
                          child: Text(
                            'Finish',
                            style: TextStyle(
                                color: MyColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
