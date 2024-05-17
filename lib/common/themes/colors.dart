import 'dart:math';

import 'package:flutter/material.dart';

class MyColors {
  static Color primary = const Color(0xFF7b0202);
  static Color primary2 = const Color(0xFF7b0202);
  static Color secondery = const Color(0xFF7b0202);
  static Color accent = const Color.fromARGB(255, 236, 187, 187);
  static Color randomColor() =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color light = Colors.grey;
}
