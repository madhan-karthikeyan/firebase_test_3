import 'package:cloud_firestore/cloud_firestore.dart';

class Engine {
  String? id;
  double? oilLevel;
  bool? isFunctional;

  Engine({this.id, this.oilLevel, this.isFunctional});

  factory Engine.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;

    return Engine(
      id: doc.id,
      oilLevel: data?['oilLevel']?.toDouble(),
      isFunctional: data?['isFunctional'] ?? true,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'oilLevel': oilLevel,
      'isFunctional': isFunctional,
    };
  }
}
