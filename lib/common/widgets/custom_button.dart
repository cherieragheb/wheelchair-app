import 'package:flutter/material.dart';
import 'package:tom/common/themes/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.size = const Size(120, 30),
    this.isOutlined = false,
  });

  final Size? size;
  final String text;
  final bool isOutlined;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            fixedSize: size,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            backgroundColor: isOutlined ? MyColors.primary : MyColors.white,
            foregroundColor: isOutlined ? MyColors.primary : MyColors.black),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: isOutlined ? MyColors.white : MyColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600),
        ));
  }
}
