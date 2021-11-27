// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:medicare/screens/patient/home/doctor_details/doctor_details.dart';
import 'package:medicare/utils/theme/theme.dart';
import 'package:medicare/utils/widgets/custom_button.dart';

class DoctorList extends StatelessWidget {
  static String id = 'doctor_list';
  const DoctorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userImage =
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
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  margin: EdgeInsets.only(
                    bottom: 5.0,
                  ),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1.0,
                          blurRadius: 6.0,
                        ),
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: size.width * 0.83,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Color(0xFFD9D9D9),
                              backgroundImage: AssetImage(userImage),
                              radius: size.width * 0.1,
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
                                CustomButton(
                                  child: Text('View'),
                                  gradient: CustomTheme.buttonGradient,
                                  onPressed: () {
                                    // TODO: navigate to doctor detail screen pass doctor info
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PatientDoctorDetails(''),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.medical_services, // TODO use heart icon here
                        color: primaryColor,
                        size: 25,
                      ),
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }
}
