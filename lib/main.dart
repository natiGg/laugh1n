import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive/hive.dart';
import 'package:laugh1/bindings/main_binding.dart';
import 'package:laugh1/model/theme_model.dart';
import 'package:laugh1/screens/home/controller/initialcontroller.dart';
import 'package:laugh1/screens/home/home.dart';
import 'package:laugh1/screens/splash/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'screens/constants/constants.dart';
import 'screens/home/controller/theme_controller.dart';
import 'screens/routes/app_pages.dart';
import 'screens/theme/theme.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var path = Directory.current.path;
  var dir = await getApplicationDocumentsDirectory();

  await Hive
    ..init(dir.path)
    ..registerAdapter(themesettingAdapter());

  await Hive.openBox('settings'); // Open the box that will store the settings

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application
  // .

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    final ThemeController _themeController = Get.put(ThemeController());

    return GetMaterialApp(
      getPages: AppPages.routes,
      home: SplashScreen(),
      initialBinding:
          MainBindings(), // Initial Binding to make Sure the ThemeController is initialized
      themeMode: _themeController
          .themeStateFromHiveSettingBox, // Setting the ThemeMode from the Hive Setting Box
      theme: CustomTheme.lightTheme, // CustomThemeData for Light Theme
      darkTheme: CustomTheme.darkTheme, //
      debugShowCheckedModeBanner: false,
      title: 'Laugh1',
      // Theme mode depends on device settings at the beginning
    );
  }
}
