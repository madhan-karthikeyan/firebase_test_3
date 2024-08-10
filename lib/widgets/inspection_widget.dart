import 'package:flutter/material.dart';

class InspectionWidget extends StatelessWidget {
  final String truckNumber;
  final String duration;
  final String inspectionType;
  final String address;
  final String date;

  const InspectionWidget({
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
        if (date != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              date,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
        Container(
          margin: EdgeInsets.symmetric(vertical: 4.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.amber[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                truckNumber,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.access_time, size: 16),
                  SizedBox(width: 4),
                  Text(duration),
                  SizedBox(width: 16),
                  Icon(Icons.description, size: 16),
                  SizedBox(width: 4),
                  Text(inspectionType),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.location_pin, size: 16),
                  SizedBox(width: 4),
                  Expanded(child: Text(address)),
                ],
              ),
            ],
          ),
        ),
      ],
    );;
  }
}