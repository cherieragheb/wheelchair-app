import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tom2/screens/home.dart';
import 'screens/home.dart';
import 'screens/welcome.dart';
import 'screens/get_started.dart';
import 'screens/login.dart';
import 'screens/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home(),
    );
  }
}
