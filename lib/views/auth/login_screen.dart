import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tom/common/themes/colors.dart';
import 'package:tom/common/widgets/curved_container.dart';
import 'package:tom/controllers/login_controller.dart';
import 'package:tom/views/auth/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.primary,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ------ Header ------ //
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'TOM',
                  style: TextStyle(
                    color: MyColors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                Text(
                  'Target On Map',
                  style: TextStyle(color: MyColors.white, fontSize: 24),
                ),
              ],
            ),
          ),
          // ------ Form ------ //
          CurvedContainer(
            height: MediaQuery.of(context).size.height * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  // Title
                  Container(
                    margin: const EdgeInsets.only(right: 70),
                    child: const Text(
                      textAlign: TextAlign.left,
                      'Log in to your account',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 20),

                  //email
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: MyColors.accent,
                    ),
                    child: TextFormField(
                        controller: controller.email,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          border: InputBorder.none,
                          hintText: 'Email',
                        )),
                  ),
                  const SizedBox(height: 20),

                  //password
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: MyColors.accent,
                    ),
                    child: Obx(() => TextFormField(
                          controller: controller.password,
                          obscureText: controller.isHidden.value,
                          decoration: InputDecoration(
                            icon: const Icon(Icons.lock),
                            border: InputBorder.none,
                            hintText: 'password',
                            suffixIcon: IconButton(
                              onPressed: () => controller.isHidden.value =
                                  !controller.isHidden.value,
                              icon: controller.isHidden.value
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(height: 20),

                  // login
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.secondery,
                          minimumSize: const Size(double.infinity, 0),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)))),
                      onPressed: () => controller.loginUser(),
                      child: Text(
                        'Log in',
                        style: TextStyle(
                            color: MyColors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )),

                  // sign up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('do not have an account?'),
                      TextButton(
                          onPressed: () => Get.to(const SignupScreen()),
                          child: const Text('Sign Up'))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
