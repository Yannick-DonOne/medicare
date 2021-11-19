import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PatientDashBoardScreen extends StatefulWidget {
  static String id = 'dashboard_screen';
  const PatientDashBoardScreen({Key? key}) : super(key: key);

  @override
  _PatientDashBoardScreenState createState() => _PatientDashBoardScreenState();
}

class _PatientDashBoardScreenState extends State<PatientDashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColorScreen,
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: size.width * 0.05,
          mainAxisSpacing: size.width * 0.05,
          shrinkWrap: true,
          padding: const EdgeInsets.all(16.0),
          children: [
            Card(
              margin: EdgeInsets.all(0),
              color: whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    FontAwesomeIcons.userNurse,
                    color: primaryColor,
                    size: size.width * 0.25,
                  ),
                  Text(
                    'Find Doctor',
                    style: TextStyle(
                      color: black.withOpacity(0.8),
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(0),
              color: whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    FontAwesomeIcons.ambulance,
                    color: primaryColor,
                    size: size.width * 0.25,
                  ),
                  Text(
                    'Emergency',
                    style: TextStyle(
                      color: black.withOpacity(0.8),
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(0),
              color: whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    FontAwesomeIcons.medkit,
                    color: primaryColor,
                    size: size.width * 0.25,
                  ),
                  Text(
                    'Doctroid',
                    style: TextStyle(
                      color: black.withOpacity(0.8),
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(0),
              color: whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    FontAwesomeIcons.clinicMedical,
                    color: primaryColor,
                    size: size.width * 0.25,
                  ),
                  Text(
                    'Doctroid',
                    style: TextStyle(
                      color: black.withOpacity(0.8),
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(0),
              color: whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    FontAwesomeIcons.notesMedical,
                    color: primaryColor,
                    size: size.width * 0.25,
                  ),
                  Text(
                    'Appointments',
                    style: TextStyle(
                      color: black.withOpacity(0.8),
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(0),
              color: whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    FontAwesomeIcons.capsules,
                    color: primaryColor,
                    size: size.width * 0.25,
                  ),
                  Text(
                    'Medical Shop',
                    style: TextStyle(
                      color: black.withOpacity(0.8),
                      fontSize: size.width * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
