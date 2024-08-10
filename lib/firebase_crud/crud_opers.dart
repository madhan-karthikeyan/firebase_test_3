import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test_3/models/data_models/inspection.dart';
class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addInspection(Inspection inspection) async {
    await _db.collection('inspections').doc(inspection.inspectionID).set(inspection.toMap());
  }
   Stream<List<Inspection>> getInspections() {
    return _db.collection('inspections').snapshots().map(
      (snapshot) => snapshot.docs
          .map((doc) => Inspection.fromMap(doc.data()))
          .toList(),
    );
  }

  Future<Inspection?> getInspectionById(String inspectionID) async {
    final doc = await _db.collection('inspections').doc(inspectionID).get();
    return doc.exists ? Inspection.fromMap(doc.data()!) : null;
  }

  Future<void> updateInspection(Inspection inspection) async {
    await _db.collection('inspections').doc(inspection.inspectionID).update(inspection.toMap());
  }

  Future<void> deleteInspection(String inspectionID) async {
    await _db.collection('inspections').doc(inspectionID).delete();
  }
}
