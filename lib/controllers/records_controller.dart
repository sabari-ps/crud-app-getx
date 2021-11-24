import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_app/models/student_data.dart';
import 'package:students_app/views/widgets/dialog_box.dart';
import 'package:students_app/views/widgets/snack_bar.dart';

class RecordsController extends GetxController {
  // TEXTFIELDS VARIABLES.
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameCtrl, phoneCtrl;

  // FIRESTORE VARIABLES.
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference collectionReference;

  // LIST WHICH STORES STUDENT RECORDS.
  RxList<StudentModel> students = <StudentModel>[].obs;

  // CONTROLLER INITIALISATION METHOD.
  @override
  void onInit() {
    super.onInit();
    nameCtrl = TextEditingController();
    phoneCtrl = TextEditingController();
    collectionReference = firestore.collection('students');
    students.bindStream(getAllStudents());
  }

  String? validateName(String name) {
    if (name.isEmpty) {
      return "Must enter the name";
    }
    return null;
  }

  String? validatePhone(String phone) {
    if (phone.isEmpty) {
      return "Must enter the phone";
    }
    return null;
  }

  // METHOD FOR FETCHING STUDENT RECORDS.
  Stream<List<StudentModel>> getAllStudents() =>
      collectionReference.snapshots().map((query) =>
          query.docs.map((item) => StudentModel.fromMap(item)).toList());

  // METHOD FOR SAVING STUDENT DATA.
  void saveUpdateStudent(
    String name,
    int phone,
    String docId,
    int mode,
  ) {
    final isValidated = formKey.currentState!.validate();
    if (!isValidated) {
      return;
    }
    formKey.currentState!.save();

    if (mode == 1) {
      CustomDialogBox.showDialogBox();
      collectionReference.add(
        {
          'name': name,
          'phone': phone,
        },
      ).whenComplete(
        () {
          CustomDialogBox.cancelDialogBox();
          clearEditControllers();
          Get.back();
          CustomSnackBar.showSnackBar(
            context: Get.context,
            snackTitle: "Student Added",
            snackMessage: "Student record is added successfully!",
            snackBackgroundColor: Colors.deepOrange,
          );
        },
      ).catchError(
        (error) {
          CustomDialogBox.cancelDialogBox();
          CustomSnackBar.showSnackBar(
            context: Get.context,
            snackTitle: "Error Occurred",
            snackMessage: "Something Went Wrong",
            snackBackgroundColor: Colors.deepOrange,
          );
        },
      );
    } else if (mode == 2) {
      CustomDialogBox.showDialogBox();
      collectionReference.doc(docId).update(
        {
          'name': name,
          'phone': phone,
        },
      ).whenComplete(
        () {
          CustomDialogBox.cancelDialogBox();
          clearEditControllers();
          Get.back();
          CustomSnackBar.showSnackBar(
            context: Get.context,
            snackTitle: "Student Updated",
            snackMessage: "Data updated successfully!!!",
            snackBackgroundColor: Colors.deepOrange,
          );
        },
      ).catchError((error) {
        CustomDialogBox.cancelDialogBox();
        CustomSnackBar.showSnackBar(
          context: Get.context,
          snackTitle: "Error Occurred",
          snackMessage: "Something Went Wrong!!!",
          snackBackgroundColor: Colors.deepOrange,
        );
      });
    }
  }

  @override
  void onClose() {
    super.onClose();
    nameCtrl.dispose();
    phoneCtrl.dispose();
  }

  void clearEditControllers() {
    nameCtrl.clear();
    phoneCtrl.clear();
  }

  void deleteRecord(String docId) {
    CustomDialogBox.showDialogBox();
    collectionReference.doc(docId).delete().whenComplete(
      () {
        CustomDialogBox.cancelDialogBox();
        Get.back();
        CustomSnackBar.showSnackBar(
          context: Get.context,
          snackTitle: "Student Deleted",
          snackMessage: "Student Record Deleted Successfully",
          snackBackgroundColor: Colors.deepOrange,
        );
      },
    ).catchError(
      (error) {
        CustomDialogBox.cancelDialogBox();
        CustomSnackBar.showSnackBar(
          context: Get.context,
          snackTitle: "ERROR OCCURED",
          snackMessage: "Something Went Wrong",
          snackBackgroundColor: Colors.deepOrange,
        );
      },
    );
  }
}
