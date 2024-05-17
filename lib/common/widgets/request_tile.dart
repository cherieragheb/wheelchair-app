import 'package:flutter/material.dart';
import 'package:tom/common/themes/colors.dart';
import 'package:tom/controllers/user_controller.dart';
import 'package:tom/models/request_model.dart';

class RequestTile extends StatelessWidget {
  const RequestTile(this.request, {super.key});

  final RequestModel request;

  @override
  Widget build(BuildContext context) {
    final user = UserController.instance.getUserById(request.sourceId);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: MyColors.primary),
        ),
        leading: CircleAvatar(
          radius: 35,
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  child: Text(
                    "Accept",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                ElevatedButton(
                  child: const Text(
                    "Refuse",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
