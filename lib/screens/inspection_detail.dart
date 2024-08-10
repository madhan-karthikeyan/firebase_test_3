import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/firestore_service.dart';
import '../models/data_models/inspection.dart';

class InspectionDetailScreen extends StatelessWidget {
  final String inspectionId;

  InspectionDetailScreen({required this.inspectionId});

  @override
  Widget build(BuildContext context) {
    final firestoreService = Provider.of<FirestoreService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Inspection Details'),
      ),
      body: StreamBuilder<Inspection?>(
        stream: firestoreService.getInspectionById(inspectionId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data != null) {
            final inspection = snapshot.data!;

            return ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                ListTile(
                  title: Text('Inspection ID: ${inspection.id ?? 'Unknown ID'}'),
                ),
                ListTile(
                  title: Text('Date: ${inspection.date?.toLocal().toString() ?? 'Unknown'}'),
                ),
                ListTile(
                  title: Text('Technician ID: ${inspection.technicianId ?? 'Unknown'}'),
                ),
                ListTile(
                  title: Text('Customer ID: ${inspection.customerId ?? 'Unknown'}'),
                ),
                ListTile(
                  title: Text('Status: ${inspection.status ?? 'Pending'}'),
                ),
              ],
            );
          } else {
            return Center(child: Text('No inspection details available.'));
          }
        },
      ),
    );
  }
}
