import 'package:flutter/material.dart';

class PatientNotificationsScreen extends StatefulWidget {
  static String id = 'notifications_screen';
  const PatientNotificationsScreen({Key? key}) : super(key: key);

  @override
  _PatientNotificationsScreenState createState() =>
      _PatientNotificationsScreenState();
}

class _PatientNotificationsScreenState
    extends State<PatientNotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Notifications Screen'),
        ),
      ),
    );
  }
}
