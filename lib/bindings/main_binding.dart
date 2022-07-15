import 'package:get/get.dart';
import 'package:laugh1/screens/home/controller/initialcontroller.dart';
import 'package:laugh1/screens/home/controller/maincontroller.dart';
import 'package:laugh1/screens/home/controller/theme_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainController());
    Get.put(InitialController());
    Get.put(ThemeController());
  }
}
