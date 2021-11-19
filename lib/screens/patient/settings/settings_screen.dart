import 'package:flutter/material.dart';
import 'package:medicare/screens/patient/profile/userDetails.dart';

class PatientSettingScreen extends StatefulWidget {
  static String id = 'settings_screen';

  const PatientSettingScreen({Key? key}) : super(key: key);

  @override
  _PatientSettingScreenState createState() => _PatientSettingScreenState();
}

class _PatientSettingScreenState extends State<PatientSettingScreen> {
  UserDetails detail = new UserDetails();

  Future<void> _getUser() async {}

  Future _signOut() async {}

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            splashRadius: 25,
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.indigo,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: Text(
          'User Settings',
          style: TextStyle(
              color: Colors.indigo, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          UserDetails(),
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
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/login', (Route<dynamic> route) => false);
                _signOut();
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
