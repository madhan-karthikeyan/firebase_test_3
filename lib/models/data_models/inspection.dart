import 'package:cloud_firestore/cloud_firestore.dart';

class Inspection {
  String? id;
  DateTime? date;
  String? technicianId;
  String? customerId;
  String? status;

  Inspection({this.id, this.date, this.technicianId, this.customerId, this.status});

  factory Inspection.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;

    return Inspection(
      id: doc.id,
      date: data?['date'] != null ? (data!['date'] as Timestamp).toDate() : null,
      technicianId: data?['technicianId'],
      customerId: data?['customerId'],
      status: data?['status'] ?? 'Pending',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'date': date,
      'technicianId': technicianId,
      'customerId': customerId,
      'status': status,
    };
  }
}
