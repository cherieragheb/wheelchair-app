import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Welcome extends StatefulWidget {
  static const String screenroute = 'Welcom';
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Column(children: [
          // ignore: avoid_unnecessary_containers
          Container(
            margin: const EdgeInsetsDirectional.only(bottom: 0, top: 60),
            child: const Column(children: [
              Text(
                'TOM',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              Text(
                'Target On Map',
                style: TextStyle(
                    color: Color.fromARGB(255, 231, 231, 235), fontSize: 24),
              ),
            ]),
          ),

          const SizedBox(
            height: 40,
          ),

          Container(
              margin: const EdgeInsets.all(0.0),
              child: const Image(
                image: AssetImage(
                  'images/location.png',
                ),
              )),
        ])),
      ),
    );
  }
}
