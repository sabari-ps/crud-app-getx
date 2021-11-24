import 'package:get/get.dart';
import 'package:students_app/views/screens/home_screen.dart';
import 'package:students_app/views/screens/login_screen.dart';
import 'package:students_app/views/screens/splash_screen.dart';

final List<GetPage<dynamic>> appRoutes = [
  GetPage(
    name: '/splash',
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: '/home',
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: '/login',
    page: () => const LoginScreen(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(
      milliseconds: 1000,
    ),
  ),
];
