import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/firestore_service.dart';
import '../models/data_models/tire.dart';

class TireDetailScreen extends StatelessWidget {
  final String inspectionId;
  final String tireId;

  TireDetailScreen({required this.inspectionId, required this.tireId});

  @override
  Widget build(BuildContext context) {
    final firestoreService = Provider.of<FirestoreService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tire Details'),
      ),
      body: StreamBuilder<Tire?>(
        stream: firestoreService.getTireById(inspectionId, tireId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data != null) {
            final tire = snapshot.data!;

            return ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                ListTile(
                  title: Text('Tire ID: ${tire.id ?? 'Unknown ID'}'),
                ),
                ListTile(
                  title: Text('Position: ${tire.position ?? 'Unknown'}'),
                ),
                ListTile(
                  title: Text('Tread Depth: ${tire.treadDepth?.toString() ?? 'Unknown'} mm'),
                ),
                ListTile(
                  title: Text('Damaged: ${tire.isDamaged != null ? (tire.isDamaged! ? 'Yes' : 'No') : 'Unknown'}'),
                ),
              ],
            );
          } else {
            return Center(child: Text('No tire details available.'));
          }
        },
      ),
    );
  }
}
