import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static void showSnackBar({
    required BuildContext? context,
    required String snackTitle,
    required String snackMessage,
    required Color snackBackgroundColor,
  }) {
    Get.snackbar(
      snackTitle,
      snackMessage,
      titleText: Text(
        snackTitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        snackMessage,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          letterSpacing: 1.0,
          fontSize: 12.0,
          color: Colors.white,
        ),
      ),
      borderRadius: 8.0,
      backgroundColor: snackBackgroundColor,
      snackPosition: SnackPosition.BOTTOM,
      animationDuration: const Duration(milliseconds: 200),
      snackStyle: SnackStyle.FLOATING,
      padding: const EdgeInsets.all(8.0),
    );
  }
}
