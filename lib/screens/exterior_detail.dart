import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/firestore_service.dart';
import '../models/data_models/exterior.dart';

class ExteriorDetailScreen extends StatelessWidget {
  final String inspectionId;
  final String exteriorId;

  ExteriorDetailScreen({required this.inspectionId, required this.exteriorId});

  @override
  Widget build(BuildContext context) {
    final firestoreService = Provider.of<FirestoreService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Exterior Details'),
      ),
      body: StreamBuilder<Exterior?>(
        stream: firestoreService.getExteriorById(inspectionId, exteriorId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data != null) {
            final exterior = snapshot.data!;

            return ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                ListTile(
                  title: Text('Exterior ID: ${exterior.id ?? 'Unknown ID'}'),
                ),
                ListTile(
                  title: Text('Condition: ${exterior.condition ?? 'Unknown'}'),
                ),
                ListTile(
                  title: Text('Damages: ${exterior.damages?.join(', ') ?? 'None'}'),
                ),
              ],
            );
          } else {
            return Center(child: Text('No exterior details available.'));
          }
        },
      ),
    );
  }
}
