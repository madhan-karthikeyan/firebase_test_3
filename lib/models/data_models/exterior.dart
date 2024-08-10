import 'package:cloud_firestore/cloud_firestore.dart';

class Exterior {
  String? id;
  String? condition;
  List<String>? damages;

  Exterior({this.id, this.condition, this.damages});

  factory Exterior.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;

    return Exterior(
      id: doc.id,
      condition: data?['condition'],
      damages: (data?['damages'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'condition': condition,
      'damages': damages,
    };
  }
}
