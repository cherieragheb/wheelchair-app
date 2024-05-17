import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tom/common/themes/colors.dart';
import 'package:tom/common/types/category.dart';
import 'package:tom/common/widgets/place_tile.dart';
import 'package:tom/controllers/places_list_controller.dart';
import 'package:tom/views/places/place_reviews_screen.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key, required this.title, this.category});

  final String title;
  final PlaceCategory? category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PlacesListController(category));
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: MyColors.primary,
        ),
        body: Obx(
          () => controller.placesList.isEmpty
              ? const Center(child: Text('No places found'))
              : ListView.separated(
                  itemCount: controller.placesList.length,
                  itemBuilder: (context, index) => PlaceTile(
                    place: controller.placesList[index],
                    onTap: () => Get.to(() => PlaceReviewsScreen(
                        place: controller.placesList[index])),
                  ),
                  separatorBuilder: (context, index) =>
                      Divider(height: 1, color: MyColors.accent),
                ),
        ));
  }
}
