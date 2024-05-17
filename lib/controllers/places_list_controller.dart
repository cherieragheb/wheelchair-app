import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tom/common/types/category.dart';
import 'package:tom/common/types/user.dart';
import 'package:tom/controllers/place_controller.dart';
import 'package:tom/controllers/user_controller.dart';
import 'package:tom/models/place_model.dart';

class PlacesListController extends GetxController {
  PlaceCategory? category;

  PlacesListController(this.category);

  RxList<Place> placesList = <Place>[].obs;
  final user = UserController.instance.currrentUser;

  @override
  void onReady() {
    super.onReady();
    fetchSpecificPlaces();
    if (kDebugMode) {
      print("===fetched ${placesList.length} places list successfully===");
    }
  }

  fetchSpecificPlaces() {
    placesList.clear();
    final userType = user.userType;
    switch (userType) {
      case UserType.wheelchair:
        placesList.addAll(PlaceController.instance.places
            .where((place) => place.category == category)
            .toList());
        break;
      case UserType.provider:
        placesList.addAll(PlaceController.instance.places
            .where((place) => place.providerId == user.id)
            .toList());
        break;
      default:
    }
  }
}
