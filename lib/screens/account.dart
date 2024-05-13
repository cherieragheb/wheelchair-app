import 'package:flutter/material.dart';

class account extends StatefulWidget {
  const account({super.key});

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
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
                    color: Colors.deepPurple.withOpacity(.2)),
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
