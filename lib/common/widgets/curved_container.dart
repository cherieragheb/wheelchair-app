import 'package:flutter/material.dart';
import 'package:tom/common/themes/colors.dart';

class CurvedContainer extends StatelessWidget {
  const CurvedContainer({super.key, this.height, this.padding, this.child});

  final double? height;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(45.0),
          topRight: Radius.circular(45.0),
        ),
      ),
      padding: padding,
      child: child,
    );
  }
}
