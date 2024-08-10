import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  String? id;
  String? name;
  String? contactInfo;

  Customer({this.id, this.name, this.contactInfo});

  factory Customer.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;

    return Customer(
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
