import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          height: 0,
        ),
        title: Text(
          'My Inspections',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        leading: Icon(Icons.supervised_user_circle),
        
      ),
    );
  }
}
