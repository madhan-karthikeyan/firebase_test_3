import 'package:flutter/material.dart';

class InspectionWidget extends StatelessWidget {
  final String truckNumber;
  final String duration;
  final String inspectionType;
  final String address;
  final String date;

  const InspectionWidget({super.key, 
    required this.truckNumber,
    required this.duration,
    required this.inspectionType,
    required this.address,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            date,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.amber[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                truckNumber,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.access_time, size: 16),
                  const SizedBox(width: 4),
                  Text(duration),
                  const SizedBox(width: 16),
                  const Icon(Icons.description, size: 16),
                  const SizedBox(width: 4),
                  Text(inspectionType),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_pin, size: 16),
                  const SizedBox(width: 4),
                  Expanded(child: Text(address)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}