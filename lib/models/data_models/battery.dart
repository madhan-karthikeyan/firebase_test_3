import 'package:cloud_firestore/cloud_firestore.dart';

class Battery {
  String? id;
  double? voltage;
  bool? isFunctional;

  Battery({this.id, this.voltage, this.isFunctional});

  factory Battery.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;

    return Battery(
      id: doc.id,
      voltage: data?['voltage']?.toDouble(),
      isFunctional: data?['isFunctional'] ?? true,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'voltage': voltage,
      'isFunctional': isFunctional,
    };
  }
}
