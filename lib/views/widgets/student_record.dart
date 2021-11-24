import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:students_app/main.dart';
import 'package:students_app/views/widgets/bottom_sheet.dart';

class StudentRecord extends StatelessWidget {
  final String name;
  final int phone;
  final String docId;
  const StudentRecord({
    Key? key,
    required this.name,
    required this.phone,
    required this.docId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.deepOrange,
          child: Text(
            name.substring(0, 2).toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 3.0,
            ),
          ),
        ),
        subtitle: Text(
          phone.toString(),
        ),
        onTap: () {
          dataController.nameCtrl.text = name;
          dataController.phoneCtrl.text = phone.toString();
          CustomBottomSheet.addEditStudentSheet(
              docId: docId, mode: 2, text: "UPDATE");
        },
        trailing: IconButton(
          onPressed: showDeletePopup,
          icon: const Icon(
            Icons.delete,
          ),
        ),
      ),
    );
  }

  void showDeletePopup() {
    Get.dialog(
      AlertDialog(
        title: const Text(
          "DELETE RECORD",
          style: TextStyle(
            fontSize: 14.0,
            letterSpacing: 2.0,
          ),
        ),
        content: const Text(
          "Do you want to delete this record",
          style: TextStyle(
            fontSize: 12.0,
            letterSpacing: 1.0,
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.close,
            ),
            label: const Text(
              "CLOSE",
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              dataController.deleteRecord(docId);
            },
            icon: const Icon(
              Icons.delete,
            ),
            label: const Text(
              "DELETE",
            ),
          ),
        ],
      ),
    );
  }
}
