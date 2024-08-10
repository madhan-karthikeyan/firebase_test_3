import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/firestore_service.dart';
import '../models/data_models/battery.dart';

class BatteryDetailScreen extends StatelessWidget {
  final String inspectionId;
  final String batteryId;

  BatteryDetailScreen({required this.inspectionId, required this.batteryId});

  @override
  Widget build(BuildContext context) {
    final firestoreService = Provider.of<FirestoreService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Battery Details'),
      ),
      body: StreamBuilder<Battery?>(
        stream: firestoreService.getBatteryById(inspectionId, batteryId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data != null) {
            final battery = snapshot.data!;

            return ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                ListTile(
                  title: Text('Battery ID: ${battery.id ?? 'Unknown ID'}'),
                ),
                ListTile(
                  title: Text('Voltage: ${battery.voltage?.toString() ?? 'Unknown'} V'),
                ),
                ListTile(
                  title: Text('Functional: ${battery.isFunctional != null ? (battery.isFunctional! ? 'Yes' : 'No') : 'Unknown'}'),
                ),
              ],
            );
          } else {
            return Center(child: Text('No battery details available.'));
          }
        },
      ),
    );
  }
}
