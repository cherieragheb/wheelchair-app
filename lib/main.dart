import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tom2/screens/account.dart';
import 'package:tom2/screens/chatpage.dart';
import 'package:tom2/screens/get_started.dart';
import 'package:tom2/screens/home.dart';
import 'package:tom2/screens/nav_menu.dart';
import 'package:tom2/screens/profile.dart';
import 'package:tom2/screens/provider.dart';
import 'package:tom2/screens/request.dart';
import 'package:tom2/screens/services.dart';
import 'package:tom2/screens/setting.dart';
import 'package:tom2/screens/voulnteer.dart';
import 'package:tom2/screens/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: profile(),
    );
  }
}
