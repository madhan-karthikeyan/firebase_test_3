// brakes.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Brakes {
  final String? id;
  final double? padThickness;
  final bool? isFunctional;

  Brakes({
    this.id,
    this.padThickness,
    this.isFunctional,
  });

  // Create a Brakes instance from a Firestore document snapshot
  factory Brakes.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    if (data != null) {
      return Brakes(
        id: data['id'] as String?,
        padThickness: (data['padThickness'] as num?)?.toDouble(),
        isFunctional: data['isFunctional'] as bool?,
      );
    } else {
      return Brakes();
    }
  }

  // Convert the Brakes instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'padThickness': padThickness,
      'isFunctional': isFunctional,
    };
  }

  // Create a Map for Firestore (can be the same as toMap)
  Map<String, dynamic> toFirestore() {
    return toMap();
  }
}
