import 'package:flutter/material.dart';
import 'package:tom2/screens/profile.dart';

class Voulnteer extends StatefulWidget {
  const Voulnteer({super.key});

  @override
  State<Voulnteer> createState() => _VoulnteerState();
}

class _VoulnteerState extends State<Voulnteer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: null,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.deepPurple,
              fixedColor: Colors.white,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(icon: Icon(Icons.chat), label: "chats"),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "settings",
                ),
              ],
            ),
            body: Column(children: [
              Stack(children: [
                Column(
                  children: [
                    Container(
                      color: const Color.fromRGBO(108, 50, 173, 1),
                      width: double.infinity,
                      child:
                          const Padding(padding: EdgeInsets.only(bottom: 209)),
                    ),
                  ],
                ),
                Center(
                    child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 150),
                      child: const Column(children: [
                        CircleAvatar(
                          maxRadius: 50,
                          backgroundImage:
                              AssetImage('assets/images/profile.jpg'),
                        ),
                        Text(
                          'username',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ]),
                    ),
                    Container(
                      height: 65,
                      width: 320,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const profile()));
                          },
                          child: const Text(
                            'Messeges',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    Container(
                      height: 65,
                      width: 320,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const profile()));
                          },
                          child: const Text(
                            'See your requests',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                  ],
                ))
              ])
            ])));
  }
}
