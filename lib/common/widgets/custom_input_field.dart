import 'package:flutter/material.dart';
import 'package:tom/common/themes/colors.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    this.controller,
    required this.text,
    required this.icon,
    this.isDisabled = false,
  });

  final String text;
  final TextEditingController? controller;
  final IconData icon;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: MyColors.accent),
        child: TextFormField(
            enabled: !isDisabled,
            controller: controller,
            decoration: InputDecoration(
              icon: Icon(icon),
              border: InputBorder.none,
              hintText: text,
            )),
      ),
    );
  }
}
