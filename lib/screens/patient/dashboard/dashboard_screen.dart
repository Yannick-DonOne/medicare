// @dart=2.9
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/screens/patient/appointments/patient_appointmentList_screen.dart';
import 'package:medicare/screens/patient/find_doctor/find_doctor_bottom_sheet.dart';
import 'package:medicare/screens/patient/find_doctor/text.dart';
import 'package:medicare/utils/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dashboard_item.dart';

class PatientDashBoardScreen extends StatefulWidget {
  static String id = 'dashboard_screen';

  @override
  _PatientDashBoardScreenState createState() => _PatientDashBoardScreenState();
}

class _PatientDashBoardScreenState extends State<PatientDashBoardScreen> {

  _launchCaller(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> currentGender = ValueNotifier(genderList[0]);
    ValueNotifier<String> currentSpecialist = ValueNotifier(specialistList[0]);
    ValueNotifier<String> currentRegion = ValueNotifier(regionsList[0]);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColorScreen,
      body: SafeArea(
        child: Center(
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: size.width * 0.05,
            mainAxisSpacing: size.width * 0.05,
            shrinkWrap: true,
            padding: const EdgeInsets.all(16.0),
            children: [
              DashBoardItem(
                label: 'Find Doctor',
                icon: FontAwesomeIcons.userNurse,
                onPressed: () {
                  findDoctorSheet(context, size, currentSpecialist,
                      currentRegion, currentGender);
                  // Navigator.pushNamed(context, FindDoctor.id);
                },
              ),
              DashBoardItem(
                label: 'Emergency',
                icon: FontAwesomeIcons.ambulance,
                onPressed: () => _launchCaller("tel:" + '119'),
              ),
              DashBoardItem(
                label: 'News',
                icon: FontAwesomeIcons.medkit,
                onPressed: () {},
              ),
              DashBoardItem(
                icon: FontAwesomeIcons.notesMedical,
                label: 'Appointments',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          PatientAppointments(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
