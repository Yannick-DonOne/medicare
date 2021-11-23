import 'package:flutter/material.dart';
import 'package:medicare/screens/patient/appointments/appointmentHistoryList.dart';
import 'package:medicare/utils/theme/theme.dart';

class PatientProfileScreen extends StatefulWidget {
  static String id = 'profile_screen';
  const PatientProfileScreen({Key? key}) : super(key: key);

  @override
  _PatientProfileScreenState createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  Future<void> _getUser() async {}

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0.1, 0.5],
                      colors: [
                        Color(0xFF02dce5),
                        Color(0xFF12b7ef),
                      ],
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 5,
                  child: Container(
                    padding: EdgeInsets.only(top: 10, right: 7),
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(
                        Icons.verified_user,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height / 5,
                  padding: EdgeInsets.only(top: 75),
                  child: Text(
                    'Summit Tech',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.teal[50]!,
                    width: 5,
                  ),
                  shape: BoxShape.circle),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          padding: EdgeInsets.only(left: 20),
          height: MediaQuery.of(context).size.height / 7,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey[50],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 27,
                      width: 27,
                      color: primaryColor,
                      child: Icon(
                        Icons.mail_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'summittech@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 27,
                      width: 27,
                      color: primaryColor,
                      child: Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "xxx-xxx-xxx",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 20),
          padding: EdgeInsets.all(8),
          // height: MediaQuery.of(context).size.height / 7,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey[50],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 27,
                      width: 27,
                      color: primaryColor,
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Bio',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 38, bottom: 10),
                child: getBio(),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 15, right: 15, top: 20),
          padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueGrey[50],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      height: 27,
                      width: 27,
                      color: primaryColor,
                      child: Icon(
                        Icons.history,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Appointment History",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(right: 10),
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        height: 30,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'View all',
                            style: TextStyle(
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(left: 35, right: 15),
                child: AppointmentHistoryList(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget getBio() {
    return Column(children: [
      Text(
        "Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore ets eiusmod tempor incididunt ut labore ets.",
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black38,
        ),
      ),
    ]);
  }
}
