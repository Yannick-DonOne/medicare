import 'package:flutter/material.dart';

class PatientProfileScreen extends StatefulWidget {
  static String id = 'profile_screen';
  const PatientProfileScreen({Key? key}) : super(key: key);

  @override
  _PatientProfileScreenState createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Profile screen'),
        ),
      ),
    );
  }
}
