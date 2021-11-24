import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_app/main.dart';

class CustomBottomSheet {
  static void addEditStudentSheet({
    String? text,
    int? mode,
    String? docId,
  }) {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          child: Form(
            key: dataController.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    '$text Student',
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    controller: dataController.nameCtrl,
                    validator: (value) {
                      return dataController.validateName(value!);
                    },
                    decoration: InputDecoration(
                      hintText: "Student Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    controller: dataController.phoneCtrl,
                    validator: (value) {
                      return dataController.validatePhone(value!);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Student Phone",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      dataController.saveUpdateStudent(
                          dataController.nameCtrl.text,
                          int.parse(dataController.phoneCtrl.text),
                          docId!,
                          mode!);
                    },
                    icon: const Icon(
                      Icons.add,
                    ),
                    label: Text(
                      text!,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
