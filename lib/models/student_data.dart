import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  String? docId;
  String? name;
  int? phone;

  StudentModel({
    required this.docId,
    required this.name,
    required this.phone,
  });

  StudentModel.fromMap(DocumentSnapshot documentSnapshot) {
    docId = documentSnapshot.id;
    name = documentSnapshot['name'];
    phone = documentSnapshot['phone'];
  }
}
