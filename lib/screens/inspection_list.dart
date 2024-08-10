import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/firestore_service.dart';
import '../models/data_models/inspection.dart';
import 'inspection_detail.dart';

class InspectionListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the Firestore service from the provider
    final firestoreService = Provider.of<FirestoreService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Inspections'),
      ),
      body: StreamBuilder<List<Inspection>>(
        stream: firestoreService.getInspections(),
        builder: (context, snapshot) {
          // Handle errors
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          // Show a loading spinner while data is being fetched
          else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          // Display the list of inspections
          else if (snapshot.hasData && snapshot.data != null) {
            final inspections = snapshot.data!;

            return ListView.builder(
              itemCount: inspections.length,
              itemBuilder: (context, index) {
                final inspection = inspections[index];
                final inspectionId = inspection.id ?? '';

                return ListTile(
                  title: Text('Inspection on ${inspection.date ?? 'Unknown Date'}'),
                  subtitle: Text('Technician: ${inspection.technicianId ?? 'Unknown Technician'}'),
                  onTap: () {
                    if (inspectionId.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InspectionDetailScreen(inspectionId: inspectionId),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Inspection ID is missing')),
                      );
                    }
                  },
                );
              },
            );
          }
          // Handle the case when there's no data
          else {
            return Center(child: Text('No inspections available.'));
          }
        },
      ),
    );
  }
}
