import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  static const LatLng _pGooglePlex = LatLng(37.4223, -122.0848);
  static const LatLng _pAppleePlex = LatLng(37.4223, -122.0848);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _pGooglePlex, zoom: 2),
      ),
    );
  }
}
