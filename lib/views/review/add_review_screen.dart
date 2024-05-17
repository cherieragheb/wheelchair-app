import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:tom/common/themes/colors.dart';
import 'package:tom/controllers/reviews_controller.dart';

class AddReviewScreen extends StatelessWidget {
  const AddReviewScreen(this.target, {super.key});

  final dynamic target;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewsController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        title: Text(
          "Add Review",
          style: TextStyle(color: MyColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Comment:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              child: TextFormField(
                minLines: 3,
                maxLines: 5,
                maxLength: 500,
                controller: controller.comment,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Text(
              'Rating:',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Center(
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) => controller.rate.value = rating,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width * .99,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(140, 92, 37, 141)),
              child: TextButton(
                  onPressed: () {
                    controller.addNewReview(target);
                    Get.back();
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                        color: MyColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )),
            ),
            const SizedBox(height: 20),
            Container(
              height: 55,
              width: MediaQuery.of(context).size.width * .99,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(140, 92, 37, 141)),
              child: TextButton(
                  onPressed: () => Get.back(),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                        color: MyColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
