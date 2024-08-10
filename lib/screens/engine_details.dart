import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/firestore_service.dart';
import '../models/data_models/engine.dart';

class EngineDetailScreen extends StatelessWidget {
  final String inspectionId;
  final String engineId;

  const EngineDetailScreen({required this.inspectionId, required this.engineId});

  @override
  Widget build(BuildContext context) {
    final firestoreService = Provider.of<FirestoreService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Engine Details'),
      ),
      body: StreamBuilder<Engine?>(
        stream: firestoreService.getEngineById(inspectionId, engineId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child:  CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data != null) {
            final engine = snapshot.data!;

            return ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                ListTile(
                  title: Text('Engine ID: ${engine.id ?? 'Unknown ID'}'),
                ),
                ListTile(
                  title: Text('Oil Level: ${engine.oilLevel?.toString() ?? 'Unknown'}'),
                ),
                ListTile(
                  title: Text('Functional: ${engine.isFunctional != null ? (engine.isFunctional! ? 'Yes' : 'No') : 'Unknown'}'),
                ),
              ],
            );
          } else {
            return Center(child: Text('No engine details available.'));
          }
        },
      ),
    );
  }
}
