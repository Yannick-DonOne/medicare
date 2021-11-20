import 'package:flutter/material.dart';
import 'package:medicare/screens/doctor/profile/doctorDetails.dart';

class DoctorSettingScreen extends StatefulWidget {
  static String id = 'settings_screen';

  const DoctorSettingScreen({Key? key}) : super(key: key);

  @override
  _DoctorSettingScreenState createState() => _DoctorSettingScreenState();
}

class _DoctorSettingScreenState extends State<DoctorSettingScreen> {
  DoctorDetails detail = new DoctorDetails();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DoctorDetails(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            padding: EdgeInsets.symmetric(horizontal: 14),
            height: MediaQuery.of(context).size.height / 14,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueGrey[50],
            ),
            child: TextButton(
              onPressed: () {
                // TODO: navigate to home screen clearing everything in storage.
              },
              style: TextButton.styleFrom(primary: Colors.grey),
              child: Text(
                'Sign out',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
