import 'package:cloud_firestore/cloud_firestore.dart';

class Inspection {
  String inspectionID;
  String truckSerialNo;
  String inspectorName;
  int inspectorID;
  String date;
  String time;
  String customerID;
  Map<String, double> coord;
  int serviceHoursMeters;

  Inspection({
    required this.inspectionID,
    required this.truckSerialNo,
    required this.inspectorName,
    required this.inspectorID,
    required this.date,
    required this.time,
    required this.customerID,
    required this.coord,
    required this.serviceHoursMeters,
  });

  // Convert Inspection to a Firestore document (Map)
  Map<String, dynamic> toMap() {
    return {
      'inspectionID': inspectionID,
      'truckSerialNo': truckSerialNo,
      'inspectorName': inspectorName,
      'inspectorID': inspectorID,
      'date': date,
      'time': time,
      'customerID': customerID,
      'coord': coord,
      'serviceHoursMeters': serviceHoursMeters,
    };
  }

  // Create an Inspection from a Firestore document (Map)
  factory Inspection.fromMap(Map<String, dynamic> map) {
    return Inspection(
      inspectionID: map['inspectionID'] ?? '',
      truckSerialNo: map['truckSerialNo'] ?? '',
      inspectorName: map['inspectorName'] ?? '',
      inspectorID: map['inspectorID'] ?? 0,
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      customerID: map['customerID'] ?? '',
      coord: Map<String, double>.from(map['coord'] ?? {}),
      serviceHoursMeters: map['serviceHoursMeters'] ?? 0,
    );
  }
}

// Define similar models for Tires, Battery, Exterior, Engine, Technician, Customer, and Feedback
