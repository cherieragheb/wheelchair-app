import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tom/common/themes/colors.dart';
import 'package:tom/models/place_model.dart';

class PlaceTile extends StatelessWidget {
  const PlaceTile({super.key, required this.place, this.onTap});

  final Place place;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: MyColors.randomColor(),
        child: Text(place.name[0].toUpperCase()),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(place.name),
          Row(
            children: [
              RatingBarIndicator(
                itemSize: 20,
                itemCount: 5,
                rating: place.avgRate,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
              Text("  (${place.rateCount})  ",
                  style: TextStyle(fontSize: 12, color: MyColors.light)),
            ],
          ),
        ],
      ),
    );
  }
}
