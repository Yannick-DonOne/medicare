import 'package:flutter/material.dart';
import 'package:medicare/screens/general/About/about_us.dart';
import 'package:medicare/screens/general/privacy/privacy_policy.dart';
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
    double width;
    double height;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
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
                SizedBox(height: 20),
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
                  child: GeneralSettings(),
                ),
                SizedBox(height: 20),
                Text(
                  'About',
                  style: TextStyle(
                    fontSize: size.width * 0.08,
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, AboutUs.id);
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: height * 0.025),
                          child: Text(
                            "About SummitCare".toString(),
                            style: TextStyle(
                                fontSize: width * 0.038, color: primaryColor),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, PrivacyPolicy.id);
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: height * 0.025),
                          child: Text(
                            "Privacy Policy".toString(),
                            style: TextStyle(
                                fontSize: width * 0.038, color: primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
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
