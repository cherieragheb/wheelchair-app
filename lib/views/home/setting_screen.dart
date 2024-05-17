import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tom/common/themes/colors.dart';
import 'package:tom/controllers/login_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primary,
        title: Text(
          'Settings',
          style: TextStyle(color: MyColors.white),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Row(
              children: [
                Icon(
                  Icons.person,
                  color: Color.fromRGBO(108, 50, 173, 1),
                ),
                Text('Account',
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(
              height: 20,
              thickness: 1,
            ),
            const SizedBox(height: 10),
            buildAccountOption(context, 'Account info'),
            buildAccountOption(context, 'change password '),
            buildAccountOption(context, 'change email '),
            const SizedBox(
              height: 40,
            ),
            const Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Color.fromRGBO(108, 50, 173, 1),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'notifications',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width * .99,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(140, 92, 37, 141)),
              child: TextButton(
                  onPressed: () => Get.put(LoginController()).logoutUser(),
                  child: Text(
                    'LogOut',
                    style: TextStyle(
                        color: MyColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

Padding buildNotificationOption(
    String title, bool value, Function onChangeMethod) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
      ],
    ),
  );
}

GestureDetector buildAccountOption(BuildContext context, String tittle) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(tittle),
              content: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [Text("data"), Text("option 2")],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('close'))
              ],
            );
          });
    },
    child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(tittle,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: MyColors.light)),
          Icon(
            Icons.arrow_forward_ios,
            color: MyColors.light,
          )
        ])),
  );
}
