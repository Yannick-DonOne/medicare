// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medicare/screens/patient/dashboard/dashboard_screen.dart';
import 'package:medicare/screens/patient/notifications/notifications_screen.dart';
import 'package:medicare/screens/patient/profile/profile_screen.dart';
import 'package:medicare/screens/patient/settings/settings_screen.dart';
import 'package:medicare/utils/theme/theme.dart';
import 'package:medicare/utils/widgets/snack_bar.dart';

import 'doctor_home_screen.dart';

class DoctorNavigationUI extends StatefulWidget {
  static String id = "DoctorNavigationUI";
  @override
  _DoctorNavigationUIState createState() => _DoctorNavigationUIState();
}

class _DoctorNavigationUIState extends State<DoctorNavigationUI> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicator =
      new GlobalKey<RefreshIndicatorState>();

  Future _refresh() async {
    setState(() {
      DoctorNavigationUI();
      CustomSnackBar(
        context,
        Text('Updated successfuly'),
        backgroundColor: success,
      );
    });
  }

  int _selectedIndex = 0;

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
    PatientDashBoardScreen(),
    DoctorHomeScreen(),
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
          title: Text('Medicare'),
          centerTitle: true,
          leading: Container(),
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
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              // ignore: deprecated_member_use
              title: Text('Dashboard'),
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
