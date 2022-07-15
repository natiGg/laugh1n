import 'package:get/get.dart';
import 'package:laugh1/bindings/main_binding.dart';
import 'package:laugh1/screens/home/home.dart';
import 'package:laugh1/screens/splash/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(name: "/home", page: () => HomePage(), binding: MainBindings()),
    GetPage(
        name: "/splash", page: () => SplashScreen(), binding: MainBindings()),
  ];
}
