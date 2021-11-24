import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDialogBox {
  static void showDialogBox() {
    Get.dialog(
      WillPopScope(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        onWillPop: () => Future.value(false),
      ),
      barrierDismissible: false,
      barrierColor: Colors.deepOrange.withOpacity(0.3),
      useSafeArea: true,
    );
  }

  static void cancelDialogBox() {
    Get.back();
  }
}
