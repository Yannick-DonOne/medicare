// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicare/screens/patient/appointments/patient_appointmentList_screen.dart';
import 'package:medicare/screens/patient/dashboard/dashboard_screen.dart';
import 'package:medicare/screens/patient/notifications/notifications_screen.dart';
import 'package:medicare/screens/patient/profile/profile_screen.dart';
import 'package:medicare/screens/patient/settings/settings_screen.dart';
import 'package:medicare/utils/theme/theme.dart';
import 'package:medicare/utils/widgets/snack_bar.dart';

import 'home_screen.dart';

class PatientNavigationUI extends StatefulWidget {
  static String id = "PatientNavigationUI";
  @override
  _PatientNavigationUIState createState() => _PatientNavigationUIState();
}

class _PatientNavigationUIState extends State<PatientNavigationUI> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicator =
      new GlobalKey<RefreshIndicatorState>();

  Future _refresh() async {
    setState(() {
      PatientNavigationUI();
      CustomSnackBar(
        context,
        Text('Updated successfuly'),
        backgroundColor: success,
      );
    });
  }

  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  List<Widget> _widgetOptions = <Widget>[
    PatientProfileScreen(),
    // PatientDashBoardScreen(),
    PatientAppointmentList(),
    PatientHomeScreen(),
    PatientNotificationsScreen(),
    PatientSettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //top bar color
      systemNavigationBarColor: Colors.black, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return RefreshIndicator(
        color: primaryColor,
        key: _refreshIndicator,
        onRefresh: _refresh,
        child: _myWidget());
  }

  Widget _myWidget() {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * 0.11),
              Image.asset('assets/images/logo.png', height: 45, width: 50),
              Text('Medicare'),
            ],
          ),
          centerTitle: true,
          leading: SizedBox(width: 0),
          backgroundColor: primaryColor,
        ),
        // drawer: CustomDrawer(),
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedItemColor: grey,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              // ignore: deprecated_member_use
              title: Text('Profile'),
            ),

            // BottomNavigationBarItem(
            //   icon: Icon(Icons.dashboard),
            //   // ignore: deprecated_member_use
            //   title: Text('Dashboard'),
            // ),

            BottomNavigationBarItem(
              icon: Icon(Icons.medical_services),
              // ignore: deprecated_member_use
              title: Text('Appiontment'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // ignore: deprecated_member_use
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              // ignore: deprecated_member_use
              title: Text('Alerts'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              // ignore: deprecated_member_use
              title: Text('Settings'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: primaryColor,
          onTap: _onItemTapped,
        ));
  }
}
