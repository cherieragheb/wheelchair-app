import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:geoflutterfire_plus/geoflutterfire_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  static LocationController instance = Get.find();

  final currentLatitude = 0.0.obs;
  final currentLongitude = 0.0.obs;
  GeoFirePoint get currentLocation =>
      GeoFirePoint(GeoPoint(currentLatitude.value, currentLongitude.value));

  final destinationLatitude = 0.0.obs;
  final destinationLongitude = 0.0.obs;

  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

  final RxSet<Marker> markers = RxSet({});

  @override
  void onReady() {
    getCurrentLocation();
    super.onReady();
  }

  void onMapCreated(GoogleMapController controller) {
    if (!mapController.isCompleted) {
      mapController.complete(controller);
    }
  }

  @override
  void dispose() {
    mapController = Completer();
    super.dispose();
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final currentPosition = await Geolocator.getCurrentPosition();
    // set current values
    currentLatitude.value = currentPosition.latitude;
    currentLongitude.value = currentPosition.longitude;
    if (kDebugMode) {
      print(
          '===Location fetched successfully: ${currentLatitude.value}, ${currentLongitude.value}===');
    }
  }

  void setDestinationLocation(LatLng destination) {
    destinationLatitude.value = destination.latitude;
    destinationLongitude.value = destination.longitude;
  }

  Future<void> updateMarker(double lat, double lng) async {
    markers.clear();
    markers.add(Marker(
      markerId: const MarkerId('current'),
      position: LatLng(lat, lng),
      icon: BitmapDescriptor.defaultMarker,
    ));
    // final GoogleMapController controller = await mapController.future;
    // await controller.animateCamera(CameraUpdate.newCameraPosition(
    //     CameraPosition(target: LatLng(lat, lng), zoom: 18)));
    if (kDebugMode) print('===added ${markers.length} marker successfully===');
  }
}
