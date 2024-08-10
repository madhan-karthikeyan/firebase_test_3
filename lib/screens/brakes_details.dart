import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/firestore_service.dart';
import '../models/data_models/brakes.dart';

class BrakesDetailScreen extends StatelessWidget {
  final String inspectionId;
  final String brakesId;

  const BrakesDetailScreen({required this.inspectionId, required this.brakesId});

  @override
  Widget build(BuildContext context) {
    final firestoreService = Provider.of<FirestoreService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Brakes Details'),
      ),
      body: StreamBuilder<Brakes?>(
        stream: firestoreService.getBrakesById(inspectionId, brakesId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data != null) {
            final brakes = snapshot.data!;

            return ListView(
              children: [
                ListTile(
                  title: Text('Brakes ID: ${brakes.id ?? 'Unknown ID'}'),
                  subtitle: Text('Pad Thickness: ${brakes.padThickness?.toString() ?? 'Unknown Thickness'}'),
                ),
                ListTile(
                  title: Text('Functional: ${brakes.isFunctional == true ? 'Yes' : 'No'}'),
                ),
              ],
            );
          } else {
            return const Center(child: Text('No brakes details available.'));
          }
        },
      ),
    );
  }
}
