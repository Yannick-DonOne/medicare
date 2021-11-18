import 'package:flutter/material.dart';

class PatientHomeScreen extends StatelessWidget {
  static String id = 'home_screen';
  const PatientHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Home Screen'),
        ),
      ),
    );
  }
}
