import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tom/common/themes/colors.dart';
import 'package:tom/common/types/user.dart';
import 'package:tom/common/widgets/custom_input_field.dart';
import 'package:tom/controllers/signup_controller.dart';
import 'package:tom/views/auth/login_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Create An Account',
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    CustomInputField(
                      controller: controller.firstName,
                      text: 'First Name',
                      icon: Icons.person,
                    ),
                    CustomInputField(
                      controller: controller.lastName,
                      text: 'Last Name',
                      icon: Icons.person,
                    ),
                    CustomInputField(
                      controller: controller.email,
                      text: 'Email',
                      icon: Icons.email,
                    ),
                    CustomInputField(
                      controller: controller.phoneNumber,
                      text: 'Phone Number',
                      icon: Icons.phone,
                    ),
                    CustomInputField(
                      controller: controller.password,
                      text: 'password',
                      icon: Icons.lock,
                    ),
                    const CustomInputField(
                      text: 'confirmpassword',
                      icon: Icons.lock,
                    ),
                    Obx(() => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: MyColors.accent,
                        ),
                        child: DropdownButton<UserType>(
                          value: controller.userType.value,
                          isExpanded: true,
                          icon: const Icon(Icons.menu),
                          style: TextStyle(color: MyColors.white),
                          underline:
                              Container(height: 2, color: MyColors.white),
                          onChanged: (UserType? newvalue) =>
                              controller.userType.value = newvalue!,
                          items: [
                            DropdownMenuItem<UserType>(
                              value: UserType.volunteer,
                              child: Text(
                                'Volneteer',
                                style: TextStyle(color: MyColors.black),
                              ),
                            ),
                            DropdownMenuItem<UserType>(
                              value: UserType.wheelchair,
                              child: Text(
                                'Wheelchair User',
                                style: TextStyle(color: MyColors.black),
                              ),
                            ),
                            DropdownMenuItem<UserType>(
                              value: UserType.provider,
                              child: Text(
                                'Provider',
                                style: TextStyle(color: MyColors.black),
                              ),
                            ),
                          ],
                        ))),
                    const SizedBox(height: 10),
                    // create account
                    Container(
                      height: 55,
                      width: MediaQuery.of(context).size.width * .99,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: MyColors.accent,
                      ),
                      child: TextButton(
                          onPressed: () => controller.registerUser(),
                          child: Text(
                            'Next',
                            style: TextStyle(
                                color: MyColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                    const SizedBox(height: 10),
                    // Log in section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                            onPressed: () => Get.to(() => const LoginScreen()),
                            child: const Text('log in'))
                      ],
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
