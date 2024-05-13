import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tom2/screens/get_started.dart';

class Welcome extends StatefulWidget {
  static const String screenroute = 'Welcom';
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  @override
  void initsState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const Getstarted()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black],
                begin: Alignment.bottomRight,
                end: Alignment.bottomLeft)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('tom')],
          //Container(
          //  margin: const EdgeInsets.all(0.0),
          // child: const Image(
          //  image: AssetImage(
          //  'assets/images/location.png',
          // ),
          //)),
        ),
      ),

      // home: Scaffold(
      //backgroundColor: Colors.black,
      // body: Center(
      //   child: Column(children: [
      // ignore: avoid_unnecessary_containers
      //Container(
      // margin: const EdgeInsetsDirectional.only(bottom: 0, top: 60),
      // child: const Column(children: [
      // Text(
      // 'TOM',
      //style: TextStyle(
      //color: Colors.white,
      // fontWeight: FontWeight.bold,
      //fontSize: 35,
      // ),
      // ),
      // Text(
      //  'Target On Map',
      //style: TextStyle(
      //  color: Color.fromARGB(255, 231, 231, 235), fontSize: 24),
      // ),
      //   ]),
      //),

      // const SizedBox(
      /// height: 40,
      //),
    );
  }
}
