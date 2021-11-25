import 'package:flutter/material.dart';
import 'package:medicare/screens/patient/profile/userDetails.dart';
import 'package:medicare/utils/theme/theme.dart';

import 'general_settings.dart';

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'User Settings',
                  style: TextStyle(
                    fontSize: size.width * 0.08,
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: UserDetails(),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: grey,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'General Settings',
                  style: TextStyle(
                    fontSize: size.width * 0.08,
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: grey,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: GeneralSettings(),
                ),
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
          ),
        ),
      ),
    );
  }
}
