import 'package:cloud_firestore/cloud_firestore.dart';

class Technician {
  String? id;
  String? name;
  String? contactInfo;

  Technician({this.id, this.name, this.contactInfo});

  factory Technician.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;

    return Technician(
      id: doc.id,
      name: data?['name'],
      contactInfo: data?['contactInfo'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'contactInfo': contactInfo,
    };
  }
}
