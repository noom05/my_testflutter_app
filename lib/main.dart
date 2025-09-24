import 'package:flutter/material.dart';
import 'package:my_testflutter_app/pages/auth/login.dart';
import 'package:my_testflutter_app/pages/user/dashboard.dart';
import 'package:my_testflutter_app/pages/other/onboard.dart';
import 'package:my_testflutter_app/pages/user/profile.dart';
import 'package:my_testflutter_app/pages/user/trackparcel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const OnboardScreen(),
    );
  }
}
