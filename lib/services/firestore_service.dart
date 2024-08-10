import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/data_models/inspection.dart';
import '../models/data_models/tire.dart';
import '../models/data_models/battery.dart';
import '../models/data_models/exterior.dart';
import '../models/data_models/brakes.dart';
import '../models/data_models/engine.dart';
import '../models/data_models/technician.dart';
import '../models/data_models/customer.dart'; // firestore_service.dart

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // --- Inspection Operations ---
  Future<void> addOrUpdateInspection(Inspection inspection) async {
    await _db
        .collection('Inspections')
        .doc(inspection.id)
        .set(inspection.toFirestore());
  }

  Stream<List<Inspection>> getInspections() {
    return _db.collection('Inspections').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Inspection.fromFirestore(doc)).toList());
  }

  Future<void> deleteInspection(String inspectionId) async {
    await _db.collection('Inspections').doc(inspectionId).delete();
  }

  // --- Tire Operations ---
  Future<void> addOrUpdateTire(String inspectionId, Tire tire) async {
    await _db
        .collection('Inspections')
        .doc(inspectionId)
        .collection('Tires')
        .doc(tire.id)
        .set(tire.toFirestore());
  }

  Stream<List<Tire>> getTires(String inspectionId) {
    return _db
        .collection('Inspections')
        .doc(inspectionId)
        .collection('Tires')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Tire.fromFirestore(doc)).toList());
  }

  Future<void> deleteTire(String inspectionId, String tireId) async {
    await _db
        .collection('Inspections')
        .doc(inspectionId)
        .collection('Tires')
        .doc(tireId)
        .delete();
  }

  // --- Battery Operations ---
  Future<void> addOrUpdateBattery(String inspectionId, Battery battery) async {
    await _db
        .collection('Inspections')
        .doc(inspectionId)
        .collection('Battery')
        .doc(battery.id)
        .set(battery.toFirestore());
  }

  Stream<Battery?> getBattery(String inspectionId, String batteryId) {
    return _db
        .collection('Inspections')
        .doc(inspectionId)
        .collection('Battery')
        .doc(batteryId)
        .snapshots()
        .map((doc) {
      if (doc.exists) {
        return Battery.fromFirestore(doc);
      }
      return null;
    });
  }

  Future<void> deleteBattery(String inspectionId, String batteryId) async {
    await _db
        .collection('Inspections')
        .doc(inspectionId)
        .collection('Battery')
        .doc(batteryId)
        .delete();
  }

  // --- Exterior Operations ---
  Future<void> addOrUpdateExterior(
      String inspectionId, Exterior exterior) async {
    await _db
        .collection('Inspections')
        .doc(inspectionId)
        .collection('Exterior')
        .doc(exterior.id)
        .set(exterior.toFirestore());
  }

  Stream<List<Exterior>> getExteriors(String inspectionId) {
    return _db
        .collection('Inspections')
        .doc(inspectionId)
        .collection('Exterior')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Exterior.fromFirestore(doc)).toList());
  }

  Future<void> deleteExterior(String inspectionId, String exteriorId) async {
    await _db
        .collection('Inspections')
        .doc(inspectionId)
        .collection('Exterior')
        .doc(exteriorId)
        .delete();
  }

  // --- Brakes Operations ---
  Future<void> addOrUpdateBrakes(String inspectionId, Brakes brakes) async {
    await _db
        .collection('Inspections')
        .doc(inspectionId)
        .collection('Brakes')
        .doc(brakes.id)
        .set(brakes.toFirestore());
  }
Future<void> saveBrakes(String inspectionId, Brakes brakes) async {
    try {
      await _db
          .collection('inspections')
          .doc(inspectionId)
          .collection('brakes')
          .doc(brakes.id) // Ensure brakes.id is set
          .set(brakes.toFirestore()); // Save data
    } catch (e) {
      print('Error saving brakes: $e');
    }
  }
  Stream<List<Brakes>> getBrakes(String inspectionId) {
    return _db
        .collection('Inspections')
        .doc(inspectionId)
        .collection('Brakes')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Brakes.fromFirestore(doc)).toList());
  }

  Future<void> deleteBrakes(String inspectionId, String brakesId) async {
    await _db
        .collection('Inspections')
        .doc(inspectionId)
        .collection('Brakes')
        .doc(brakesId)
        .delete();
  }

  // --- Engine Operations ---
  Future<void> addOrUpdateEngine(String inspectionId, Engine engine) async {
    await _db
        .collection('Inspections')
        .doc(inspectionId)
        .collection('Engine')
        .doc(engine.id)
        .set(engine.toFirestore());
  }

  Stream<List<Engine>> getEngines(String inspectionId) {
    return _db
        .collection('Inspections')
        .doc(inspectionId)
        .collection('Engine')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Engine.fromFirestore(doc)).toList());
  }

  Future<void> deleteEngine(String inspectionId, String engineId) async {
    await _db
        .collection('Inspections')
        .doc(inspectionId)
        .collection('Engine')
        .doc(engineId)
        .delete();
  }

  // --- Technician Operations ---
  Future<void> addOrUpdateTechnician(Technician technician) async {
    await _db
        .collection('Technicians')
        .doc(technician.id)
        .set(technician.toFirestore());
  }

  Stream<List<Technician>> getTechnicians() {
    return _db.collection('Technicians').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Technician.fromFirestore(doc)).toList());
  }

  Future<void> deleteTechnician(String technicianId) async {
    await _db.collection('Technicians').doc(technicianId).delete();
  }

  // --- Customer Operations ---
  Future<void> addOrUpdateCustomer(Customer customer) async {
    await _db
        .collection('Customers')
        .doc(customer.id)
        .set(customer.toFirestore());
  }

  Stream<List<Customer>> getCustomers() {
    return _db.collection('Customers').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Customer.fromFirestore(doc)).toList());
  }

  Future<void> deleteCustomer(String customerId) async {
    await _db.collection('Customers').doc(customerId).delete();
  }

  Stream<Brakes?> getBrakesById(String inspectionId, String brakesId) {
    return _db
        .collection('inspections')
        .doc(inspectionId)
        .collection('brakes')
        .doc(brakesId)
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        return Brakes.fromFirestore(snapshot);
      } else {
        return null;
      }
    });
  }
  Stream<Engine?> getEngineById(String inspectionId, String engineId) {
    return _db
        .collection('inspections')
        .doc(inspectionId)
        .collection('engines')
        .doc(engineId)
        .snapshots()
        .map((snapshot) {
          if (snapshot.exists) {
            return Engine.fromFirestore(snapshot);
          } else {
            return null;
          }
        });
  }

  Stream<Tire?> getTireById(String inspectionId, String tireId) {
    return _db
        .collection('inspections')
        .doc(inspectionId)
        .collection('tires')
        .doc(tireId)
        .snapshots()
        .map((snapshot) {
          if (snapshot.exists) {
            return Tire.fromFirestore(snapshot);
          } else {
            return null;
          }
        });
  }
Stream<Battery?> getBatteryById(String inspectionId, String batteryId) {
    return _db
        .collection('inspections')
        .doc(inspectionId)
        .collection('batteries')
        .doc(batteryId)
        .snapshots()
        .map((snapshot) {
          if (snapshot.exists) {
            return Battery.fromFirestore(snapshot);
          } else {
            return null;
          }
        });
  }
  // Fetch an engine by inspection ID and engine ID
  Stream<Exterior?> getExteriorById(String inspectionId, String exteriorId) {
    return _db
        .collection('inspections')
        .doc(inspectionId)
        .collection('exteriors')
        .doc(exteriorId)
        .snapshots()
        .map((snapshot) {
          if (snapshot.exists) {
            return Exterior.fromFirestore(snapshot);
          } else {
            return null;
          }
        });
  }
Stream<Inspection?> getInspectionById(String inspectionId) {
    return _db
        .collection('inspections')
        .doc(inspectionId)
        .snapshots()
        .map((snapshot) {
          if (snapshot.exists) {
            return Inspection.fromFirestore(snapshot);
          } else {
            return null;
          }
        });
  }

}

