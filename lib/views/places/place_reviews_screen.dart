import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:tom/common/themes/colors.dart';
import 'package:tom/common/types/user.dart';
import 'package:tom/common/widgets/avatar_header.dart';
import 'package:tom/common/widgets/review_tile.dart';
import 'package:tom/controllers/reviews_controller.dart';
import 'package:tom/controllers/user_controller.dart';
import 'package:tom/models/place_model.dart';
import 'package:tom/views/review/add_review_screen.dart';

class PlaceReviewsScreen extends StatelessWidget {
  const PlaceReviewsScreen({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewsController());
    controller.updateFilterdReviews(place.id);
    return Scaffold(
      floatingActionButton:
          UserController.instance.currrentUser.userType == UserType.wheelchair
              ? FloatingActionButton(
                  backgroundColor: MyColors.primary,
                  foregroundColor: MyColors.white,
                  onPressed: () => Get.to(() => AddReviewScreen(place)),
                  child: const Icon(Icons.add),
                )
              : null,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.25, 0.25],
            colors: [
              MyColors.primary,
              MyColors.white,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.16),
            AvatarHeader(
              name: place.name,
              image: 'assets/images/profile.jpg',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBarIndicator(
                  itemSize: 30,
                  itemCount: 5,
                  rating: place.avgRate,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ),
                Text("  (${place.rateCount})  ",
                    style: TextStyle(fontSize: 16, color: MyColors.light)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(place.workHours,
                  style: TextStyle(color: MyColors.light)),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.50,
              child: Obx(() => ListView.builder(
                    itemCount: controller.filteredReviews.length,
                    itemBuilder: (context, index) =>
                        ReviewTile(review: controller.filteredReviews[index]),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
