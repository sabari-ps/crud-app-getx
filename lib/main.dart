import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:students_app/controllers/login_controller.dart';
import 'package:students_app/controllers/records_controller.dart';
import 'package:students_app/controllers/routes_controller.dart';
import 'package:students_app/routes.dart';
import 'package:students_app/views/screens/login_screen.dart';

final routeController = Get.put(RoutesController());
final loginController = Get.put(LoginController());
final dataController = Get.put(RecordsController());
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  routeController.openSplashScreen();
  loginController.initGetStorage();
  await Firebase.initializeApp();
  runApp(const StudentsApp());
}

class StudentsApp extends StatelessWidget {
  const StudentsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.deepOrange,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      initialRoute: '/splash',
      getPages: appRoutes,
      home: const LoginScreen(),
    );
  }
}
