// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:medicare/screens/patient/home/doctor_details/doctor_details.dart';
import 'package:medicare/utils/theme/theme.dart';

class DoctorList extends StatelessWidget {
  static String id = 'doctor_list';
  const DoctorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String USER_IMAGE =
        'https://cdn4.iconfinder.com/data/icons/people-avatar-flat-1/64/girl_chubby_beautiful_people_woman_lady_avatar-512.png';
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors'),
        backgroundColor: primaryColor,
      ),
      backgroundColor: bgColorScreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: size.width * 0.02,
                    horizontal: size.width * 0.025),
                margin: EdgeInsets.only(
                  bottom: 10.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1.0,
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Color(0xFFD9D9D9),
                          backgroundImage: NetworkImage(USER_IMAGE),
                          radius: 36.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: 'Wellness\n',
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Dr Ayor Kruger',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\nPoplar Pharma Limited',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '\nDermatologist \nSAn Franscisco CA | 5 min',
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PatientDoctorDetails(''),
                                  ),
                                );
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              padding: const EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: const BoxDecoration(
                                  // gradient: CustomTheme.primaryGradient,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80.0)),
                                ),
                                child: Container(
                                  constraints: const BoxConstraints(
                                      minWidth: 88.0,
                                      minHeight:
                                          36.0), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'View',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.medical_services, // TODO use heart icon here
                      color: whiteColor,
                      size: 36,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: size.width * 0.02,
                    horizontal: size.width * 0.025),
                margin: EdgeInsets.only(
                  bottom: 10.0,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1.0,
                        blurRadius: 6.0,
                      ),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Color(0xFFD9D9D9),
                          backgroundImage: NetworkImage(USER_IMAGE),
                          radius: 36.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: 'Wellness\n',
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Dr Ayor Kruger',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\nPoplar Pharma Limited',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '\nDermatologist \nSAn Franscisco CA | 5 min',
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PatientDoctorDetails(''),
                                  ),
                                );
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              padding: const EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: const BoxDecoration(
                                  // gradient: CustomTheme.primaryGradient,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80.0)),
                                ),
                                child: Container(
                                  constraints: const BoxConstraints(
                                      minWidth: 88.0,
                                      minHeight:
                                          36.0), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'View',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.medical_services, // TODO use heart icon here
                      color: whiteColor,
                      size: 36,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: size.width * 0.02,
                    horizontal: size.width * 0.025),
                margin: EdgeInsets.only(
                  bottom: 10.0,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1.0,
                        blurRadius: 6.0,
                      ),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Color(0xFFD9D9D9),
                          backgroundImage: NetworkImage(USER_IMAGE),
                          radius: 36.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: 'Wellness\n',
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Dr Ayor Kruger',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\nPoplar Pharma Limited',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '\nDermatologist \nSAn Franscisco CA | 5 min',
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PatientDoctorDetails(''),
                                  ),
                                );
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              padding: const EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: const BoxDecoration(
                                  // gradient: CustomTheme.primaryGradient,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80.0)),
                                ),
                                child: Container(
                                  constraints: const BoxConstraints(
                                      minWidth: 88.0,
                                      minHeight:
                                          36.0), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'View',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.medical_services, // TODO use heart icon here
                      color: whiteColor,
                      size: 36,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: size.width * 0.02,
                    horizontal: size.width * 0.025),
                margin: EdgeInsets.only(
                  bottom: 10.0,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 1.0,
                        blurRadius: 6.0,
                      ),
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Color(0xFFD9D9D9),
                          backgroundImage: NetworkImage(USER_IMAGE),
                          radius: 36.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                text: 'Wellness\n',
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  height: 1.3,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Dr Ayor Kruger',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\nPoplar Pharma Limited',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '\nDermatologist \nSAn Franscisco CA | 5 min',
                                    style: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 6.0,
                            ),
                            RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PatientDoctorDetails(''),
                                  ),
                                );
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              padding: const EdgeInsets.all(0.0),
                              child: Ink(
                                decoration: const BoxDecoration(
                                  // gradient: CustomTheme.primaryGradient,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(80.0)),
                                ),
                                child: Container(
                                  constraints: const BoxConstraints(
                                      minWidth: 88.0,
                                      minHeight:
                                          36.0), // min sizes for Material buttons
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'View',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.medical_services, // TODO use heart icon here
                      color: whiteColor,
                      size: 36,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
