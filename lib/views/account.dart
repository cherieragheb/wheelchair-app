import 'package:flutter/material.dart';
import 'package:tom/common/themes/colors.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: const [Text('edit')],
          title: const Text(
            'Account info',
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const CircleAvatar(
                maxRadius: 50,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: MyColors.accent),
                child: TextFormField(
                    decoration: const InputDecoration(
                  icon: Icon(Icons.location_pin),
                  border: InputBorder.none,
                  hintText: 'location',
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
