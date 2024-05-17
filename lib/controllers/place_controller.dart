import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tom/common/types/category.dart';
import 'package:tom/common/types/user.dart';
import 'package:tom/controllers/location_controller.dart';
import 'package:tom/controllers/user_controller.dart';
import 'package:tom/models/place_model.dart';
import 'package:tom/nav_menu.dart';
import 'package:tom/utils/snackbar.dart';
import 'package:uuid/uuid.dart';

class PlaceController extends GetxController {
  static PlaceController get instance => Get.find();

  final db = FirebaseFirestore.instance;
  final locCtrl = LocationController.instance;

  final List<Place> places = <Place>[];
  final filteredPlaces = <Place>[].obs;

  final searchBarController = SearchController().obs;

  final title = TextEditingController();
  final category = PlaceCategory.food.obs;
  final workHours = TextEditingController();
  final website = TextEditingController();
  final location = TextEditingController();
  final phoneNumber = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onReady() {
    loadPlaces();
    resetFields();
    setCurrentLocationInput();
    super.onReady();
  }

  void setCurrentLocationInput() {
    final lat = locCtrl.currentLocation.latitude;
    final lng = locCtrl.currentLocation.longitude;
    location.text = '$lat, $lng';
  }

  Future<void> loadPlaces() async {
    // empty the list
    places.clear();
    try {
      // fetch data from database
      await db.collection('Places').get().then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          places.add(Place.fromMap(doc.data() as Map<String, dynamic>));
        }
      });
      if (kDebugMode) {
        print('===loaded ${places.length} places successfully===');
      }
      filteredPlaces.assignAll(places);
    } catch (e) {
      if (kDebugMode) print('===Place Error ${e.toString()}===');
    }
  }

  Future<void> addNewPlace({bool firstTime = true}) async {
    // validate form
    if (!formKey.currentState!.validate()) {
      CustomSnackbar.warningSnackbar(message: 'Please fill all fields');
      return;
    }
    // new place
    final newPlace = Place(
      id: const Uuid().v4(),
      providerId: UserController.instance.currrentUser.id,
      name: title.text,
      category: category.value,
      location: locCtrl.currentLocation,
      workHours: workHours.text,
      website: website.text,
      phoneNumber: phoneNumber.text,
      rateCount: 0,
      avgRate: 0.0,
    );
    try {
      // fetch data from database
      await db.collection('Places').doc(newPlace.id).set(newPlace.toMap());
      // refresh list
      loadPlaces();
      if (kDebugMode) print('===added new places successfully===');
      // success messege
      CustomSnackbar.successSnackbar(
          message: 'Your place has been added successfully.');
      // go to next screen
      resetFields();
      if (firstTime) {
        Get.off(() => const NavMenu());
      }
    } catch (e) {
      CustomSnackbar.errorSnackbar(message: e.toString());
    }
  }

  void updateFilterdPlaces(String query) {
    filteredPlaces.value = places
        .where(
            (place) => place.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    if (kDebugMode) {
      print('===filtered ${filteredPlaces.length} places successfully===');
    }
  }

  int currentUserPlacesCount() {
    if (UserController.instance.currrentUser.userType == UserType.provider) {
      final list = places
          .where((place) =>
              place.providerId == UserController.instance.currrentUser.id)
          .toList();
      return list.length;
    }
    return 0;
  }

  resetFields() {
    title.clear();
    category.value = PlaceCategory.food;
    workHours.clear();
    website.clear();
    location.clear();
    phoneNumber.clear();
  }
}
