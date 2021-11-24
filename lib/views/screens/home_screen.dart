import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_app/controllers/records_controller.dart';
import 'package:students_app/main.dart';
import 'package:students_app/views/widgets/bottom_sheet.dart';
import 'package:students_app/views/widgets/student_record.dart';

class HomeScreen extends GetView<RecordsController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "STUDAPP",
          style: TextStyle(
            color: Colors.deepOrange,
            letterSpacing: 5.0,
            fontWeight: FontWeight.w200,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => showPopUp(context),
            icon: const Icon(
              Icons.logout,
              color: Colors.deepOrange,
            ),
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: dataController.students.length,
          itemBuilder: (context, index) => StudentRecord(
            name: dataController.students[index].name!,
            phone: dataController.students[index].phone!,
            docId: dataController.students[index].docId!,
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CustomBottomSheet.addEditStudentSheet(
            text: "ADD",
            docId: "",
            mode: 1,
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Future<void> showPopUp(BuildContext ctx) async {
    return showDialog(
        context: ctx,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: const Text(
              "Do you want to logout?",
            ),
            actions: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.close,
                ),
                label: const Text(
                  "CANCEL",
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  loginController.performLogout();
                },
                icon: const Icon(
                  Icons.logout,
                ),
                label: const Text(
                  "LOGOUT",
                ),
              ),
            ],
          );
        });
  }
}
