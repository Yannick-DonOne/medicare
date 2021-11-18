import 'package:flutter/material.dart';

class PatientSettingScreen extends StatefulWidget {
  static String id = 'settings_screen';

  const PatientSettingScreen({Key? key}) : super(key: key);

  @override
  _PatientSettingScreenState createState() => _PatientSettingScreenState();
}

class _PatientSettingScreenState extends State<PatientSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Settings Screen'),
        ),
      ),
    );
  }
}
