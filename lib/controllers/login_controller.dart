import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:students_app/main.dart';

class LoginController extends GetxController {
  GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    initGetStorage();
  }

  void performLogout() {
    storage.write('loggedIn', false);
    routeController.gotoLoginScreen();
  }

  void initGetStorage() async {
    await GetStorage.init();
  }
}
