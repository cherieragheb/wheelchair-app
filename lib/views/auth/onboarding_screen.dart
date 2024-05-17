import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tom/common/themes/colors.dart';
import 'package:tom/common/widgets/curved_container.dart';
import 'package:tom/views/auth/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: const Center(
                child: Image(image: AssetImage('assets/images/get.png')),
              ),
            ),
          ),
          CurvedContainer(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 77),
              child: Center(
                child: Column(children: [
                  const Text(
                    textAlign: TextAlign.center,
                    'Find your target with TOM!',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                      textAlign: TextAlign.center,
                      'Target on map helps you to find nearby places',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 59),
                        fontSize: 15,
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: ElevatedButton(
                      onPressed: () => Get.off(() => const LoginScreen()),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.secondery,
                      ),
                      child: SizedBox(
                          height: 53,
                          width: 154,
                          child: Center(
                            child: Text(
                              'Get started',
                              style: TextStyle(
                                color: MyColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          )),
                    ),
                  )
                ]),
              )),
        ],
      ),
    );
  }
}
