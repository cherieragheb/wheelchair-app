import 'package:flutter/material.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(108, 50, 173, 1),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
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
                )
              ],
            )
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
          builder: (BuildContext Context) {
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
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey)),
          const Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          )
        ])),
  );
}
