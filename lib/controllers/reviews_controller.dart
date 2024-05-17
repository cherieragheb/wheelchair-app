import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tom/common/types/user.dart';
import 'package:tom/controllers/place_controller.dart';
import 'package:tom/controllers/user_controller.dart';
import 'package:tom/models/place_model.dart';
import 'package:tom/models/review_model.dart';
import 'package:tom/models/user_model.dart';
import 'package:tom/utils/snackbar.dart';
import 'package:uuid/uuid.dart';

class ReviewsController extends GetxController {
  static ReviewsController get instance => Get.find();

  final db = FirebaseFirestore.instance;

  final List<Review> reviews = <Review>[];
  final filteredReviews = <Review>[].obs;

  final rate = 0.0.obs;
  final comment = TextEditingController();

  @override
  void onReady() {
    loadReviews();
    super.onReady();
  }

  Future<void> loadReviews() async {
    // empty the list
    reviews.clear();
    try {
      // fetch data from database
      await db.collection('Reviews').get().then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          reviews.add(Review.fromMap(doc.data() as Map<String, dynamic>));
        }
      });
      if (kDebugMode) {
        print('===loaded ${reviews.length} reivews successfully===');
      }
      filteredReviews.assignAll(reviews);
    } catch (e) {
      if (kDebugMode) print('===Review Error ${e.toString()}===');
    }
  }

  Future<void> addNewReview(dynamic target) async {
    // place review
    if (target is Place) {
      final newReview = Review(
        id: const Uuid().v4(),
        targetId: target.id,
        comment: comment.text,
        rate: rate.value,
        timeStamp: DateTime.now(),
        userName: UserController.instance.currrentUser.firstName,
      );
      try {
        // add review to database
        await db.collection('Reviews').doc(newReview.id).set(newReview.toMap());
        // update place in database
        final oldTotal = target.rateCount * target.avgRate;
        final newRateCount = target.rateCount + 1;
        final newAvgRate = (oldTotal + rate.value) / newRateCount;
        final data = {'rateCount': newRateCount, 'avgRate': newAvgRate};

        await db
            .collection('Places')
            .doc(target.id)
            .set(data, SetOptions(merge: true));
        // refresh list
        PlaceController.instance.loadPlaces();
        loadReviews();
        updateFilterdReviews(target.id);
        if (kDebugMode) print('===added new place Review successfully===');
        // success messege
        CustomSnackbar.successSnackbar(
            message: 'Your review has been added successfully.');
        // clear comment and rate
        comment.text = '';
        rate.value = 0.0;
        // go to preivous screen
        Get.back();
      } catch (e) {
        CustomSnackbar.errorSnackbar(message: e.toString());
      }
    }
    // volunteer review
    if (target is UserModel && target.userType == UserType.volunteer) {
      final newReview = Review(
        id: const Uuid().v4(),
        targetId: target.id,
        comment: comment.text,
        rate: rate.value,
        timeStamp: DateTime.now(),
        userName: UserController.instance.currrentUser.firstName,
      );
      try {
        // add review tp database
        await db.collection('Reviews').doc(newReview.id).set(newReview.toMap());
        // edit rates on user database
        final oldTotal = target.rateCount * target.avgRate;
        final newRateCount = target.rateCount + 1;
        final newAvgRate = (oldTotal + rate.value) / newRateCount;
        final data = {'rateCount': newRateCount, 'avgRate': newAvgRate};
        await db
            .collection('Users')
            .doc(target.id)
            .set(data, SetOptions(merge: true));
        // refresh list
        PlaceController.instance.loadPlaces();
        loadReviews();
        updateFilterdReviews(target.id);
        if (kDebugMode) print('===added new place Review successfully===');
        // success messege
        CustomSnackbar.successSnackbar(
            message: 'Your review has been added successfully.');
        // clear comment and rate
        comment.text = '';
        rate.value = 0.0;
        // go to preivous screen
        Get.back();
      } catch (e) {
        CustomSnackbar.errorSnackbar(message: e.toString());
      }
    }
  }

  void updateFilterdReviews(String targetId) {
    filteredReviews.clear();
    filteredReviews.value =
        reviews.where((review) => review.targetId == targetId).toList();
    if (kDebugMode) {
      print('===filtered ${filteredReviews.length} places successfully===');
    }
  }
}
