import 'package:flutter/material.dart';

class AvatarHeader extends StatelessWidget {
  const AvatarHeader({super.key, required this.name, required this.image});

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CircleAvatar(
        maxRadius: 70,
        backgroundImage: AssetImage(image),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          name,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    ]);
  }
}
