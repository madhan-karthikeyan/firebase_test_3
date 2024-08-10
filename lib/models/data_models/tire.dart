import 'package:cloud_firestore/cloud_firestore.dart';

class Tire {
  String? id;
  String? position;
  double? treadDepth;
  bool? isDamaged;

  Tire({this.id, this.position, this.treadDepth, this.isDamaged});

  factory Tire.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;

    return Tire(
      id: doc.id,
      position: data?['position'],
      treadDepth: data?['treadDepth']?.toDouble(),
      isDamaged: data?['isDamaged'] ?? false,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'position': position,
      'treadDepth': treadDepth,
      'isDamaged': isDamaged,
    };
  }
}
