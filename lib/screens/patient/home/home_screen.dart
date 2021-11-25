import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';
import 'package:medicare/utils/widgets/custom_button.dart';
import 'package:medicare/utils/widgets/moods.dart';
import 'package:medicare/utils/widgets/see_all.dart';

import 'doctor_details/doctor_details.dart';

class PatientHomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  const PatientHomeScreen({Key? key}) : super(key: key);

  @override
  _PatientHomeScreenState createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  String userImage = 'assets/images/logo.png';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Stack(
                clipBehavior: Clip.none,
                alignment: AlignmentDirectional.topCenter,
                children: <Widget>[
                  _moodsHolder(context),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: EdgeInsets.all(size.width * 0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      _notificationCard(),
                      _nextAppointmentText(),
                      _appoinmentCard(),
                      _areaSpecialistsText(),
                      _doctorCardInfo(),
                      _doctorCardInfo(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _nextAppointmentText() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Your Next Appointment',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SeeAll(
            onTap: () {},
          )
        ],
      ),
    );
  }

  Container _appoinmentCard() {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: size.width * 0.02, horizontal: size.width * 0.015),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Color(0xFFD9D9D9),
                backgroundImage: AssetImage(userImage),
                radius: 36.0,
              ),
              RichText(
                text: TextSpan(
                  text: 'Dr Dan MlayahFX',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\nSunday,May 5th at 8:00 PM',
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                      ),
                    ),
                    TextSpan(
                      text: '\n570 Kyemmer Stores \nNairobi Kenya C -54 Drive',
                      style: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Divider(
            color: Colors.grey[200],
            height: 3,
            thickness: 1,
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _iconBuilder(Icons.check_circle, 'Check-in'),
              _iconBuilder(Icons.highlight_remove, 'Cancel'),
              _iconBuilder(Icons.calendar_today_rounded, 'Calender'),
              _iconBuilder(Icons.directions, 'Directions'),
            ],
          )
        ],
      ),
    );
  }

  Container _moodsHolder(context) {
    return Container(
      height: 65.0,
      width: MediaQuery.of(context).size.width - 40,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(28)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 5.5,
              blurRadius: 5.5,
            )
          ]),
      child: MoodsSelector(),
    );
  }

  Column _iconBuilder(icon, title) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          size: 28,
          color: Colors.black,
        ),
        SizedBox(
          height: 8.0,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Container _notificationCard() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Color(0xFFBF4954),
          // gradient: redGradient,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.calendar_today,
              color: Colors.white,
              size: 32,
            ),
            Text(
              'Your Visit with \nDr Kyecera',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            OutlineButton(
              onPressed: () {},
              color: Colors.transparent,
              borderSide: BorderSide(
                color: Colors.white,
                width: 1.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26),
              ),
              child: Text(
                'Review & Add Notes',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ));
  }

  Widget _areaSpecialistsText() {
    return Container(
      margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Specialist Near You',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          SeeAll(
            onTap: () {},
          )
        ],
      ),
    );
  }

  Widget _doctorCardInfo() {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: EdgeInsets.only(
        bottom: 20.0,
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
                            text: '\nDermatologist \nSAn Franscisco CA | 5 min',
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
                            builder: (context) => PatientDoctorDetails(''),
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
  }
}
