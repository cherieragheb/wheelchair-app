import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:tom/common/themes/colors.dart';
import 'package:tom/models/user_model.dart';
import 'package:tom/views/chatpage.dart';
import 'package:tom/views/volunteers/volunteer_reviews_screen.dart.dart';

class VolunteerTile extends StatelessWidget {
  const VolunteerTile({super.key, required this.user, this.onTap});

  final UserModel user;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    popUpMenuAction(String value) {
      if (value == 'Request') {
      } else if (value == 'Chat') {
        Get.to(() => const ChatPage());
      } else if (value == 'More info') {
        Get.to(() => VolunteerReviewsScreen(user));
      }
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: MyColors.primary),
        ),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(value: 'More info', child: Text("More info")),
            const PopupMenuItem(value: 'Chat', child: Text("Chat")),
            const PopupMenuItem(value: 'Request', child: Text("Request")),
          ],
          onSelected: (value) => popUpMenuAction(value),
        ),
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: MyColors.randomColor(),
          child: Text(
              user.firstName[0].toUpperCase() + user.lastName[0].toUpperCase(),
              style: const TextStyle(fontSize: 24)),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(user.fullName, style: const TextStyle(fontSize: 18)),
            Row(
              children: [
                RatingBarIndicator(
                  itemSize: 20,
                  itemCount: 5,
                  rating: user.avgRate,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                ),
                Text("  (${user.rateCount})  ",
                    style: TextStyle(fontSize: 12, color: MyColors.light)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
