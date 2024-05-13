import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tom2/screens/profile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  static const LatLng _pGooglePlex = LatLng(37.42, -122.08);

  @override
  void initState() {
    print("object");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("current location"),
        backgroundColor: Color.fromARGB(187, 81, 28, 127),
      ),

      // bottomNavigationBar: BottomNavigationBar(

      //  items: const [
      //    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //   BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      //    BottomNavigationBarItem(
      ////     icon: Icon(Icons.category_rounded),
      //    label: "Services",
      //),
      //  ],
      //  ),
      body: Stack(children: [
        const GoogleMap(
          initialCameraPosition: CameraPosition(target: _pGooglePlex, zoom: 13),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white.withOpacity(.7)),
            child: TextFormField(
                decoration: const InputDecoration(
              icon: Icon(Icons.search),
              border: InputBorder.none,
              hintText: 'search for nearby places',
            )),
          ),
        ),
      ]),
    );
  }
}
