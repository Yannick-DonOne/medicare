import 'package:flutter/material.dart';

class PatientDashBoardScreen extends StatefulWidget {
  static String id = 'dashboard_screen';
  const PatientDashBoardScreen({Key? key}) : super(key: key);

  @override
  _PatientDashBoardScreenState createState() => _PatientDashBoardScreenState();
}

class _PatientDashBoardScreenState extends State<PatientDashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Dashboard Screen'),
        ),
      ),
    );
  }
}
