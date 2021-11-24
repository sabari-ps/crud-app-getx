import 'dart:async';
import 'package:get/get.dart';
import 'package:students_app/main.dart';

class RoutesController extends GetxController {
  void openSplashScreen() {
    Timer(
      const Duration(
        milliseconds: 5000,
      ),
      checkLoginStatus,
    );
  }

  void gotoLoginScreen() => Get.toNamed('/login');

  void gotoHomeScreen(bool withoutBack) {
    if (withoutBack) {
      Get.offAndToNamed('/home');
    } else {
      Get.toNamed('/home');
    }
  }

  void checkLoginStatus() async {
    if (loginController.storage.read('loggedIn') == true) {
      gotoHomeScreen(true);
    } else {
      gotoLoginScreen();
    }
  }
}
