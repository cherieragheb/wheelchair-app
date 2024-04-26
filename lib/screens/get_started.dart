import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:tom2/screens/login.dart';

class Getstarted extends StatefulWidget {
  static const String screenroute = 'getstarted';
  const Getstarted({super.key});

  @override
  State<Getstarted> createState() => _GetstartedState();
}

class _GetstartedState extends State<Getstarted> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color.fromARGB(140, 92, 37, 141),
            body: Center(
                child: Column(children: [
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: const Image(image: AssetImage('images/get.png'))),
              Container(
                  margin: const EdgeInsets.only(top: 50),
                  height: 410,
                  width: 380,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      )),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 70),
                  child: Center(
                    child: Column(children: [
                      const Text(
                        textAlign: TextAlign.center,
                        'Find your target with TOM!',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const Padding(padding: EdgeInsets.all(0)),
                      const Text(
                          textAlign: TextAlign.center,
                          'Target on map helps you to find nearby places',
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 59),
                            fontSize: 15,
                          )),
                      const Padding(padding: EdgeInsets.all(20)),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const login()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(140, 92, 37, 141),
                        ),
                        child: const SizedBox(
                            height: 53,
                            width: 154,
                            child: Center(
                              child: Text(
                                'Get started',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            )),
                      )
                    ]),
                  )),
            ]))));
  }
}
