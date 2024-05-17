import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tom/common/themes/colors.dart';
import 'package:tom/models/review_model.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: MyColors.randomColor(),
        child: Text(
          review.userName[0].toUpperCase(),
          style: const TextStyle(fontSize: 28),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(review.userName),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RatingBarIndicator(
                    itemSize: 20,
                    itemCount: 5,
                    rating: 3.5,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                  Text("  (${25})  ",
                      style: TextStyle(fontSize: 12, color: MyColors.light)),
                ],
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 90,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              border: Border.all(color: MyColors.accent, width: 2),
            ),
            child: Text(
              review.comment,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          )
        ],
      ),
    );
  }
}
