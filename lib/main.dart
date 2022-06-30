import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:laugh1/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laugh1',
      // Theme mode depends on device settings at the beginning
      home: const SplashScreen(),
    );
  }
}
