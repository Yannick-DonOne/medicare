import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicare/ui/components/bottomNavigationBarWidget.dart';
import 'package:medicare/ui/fragments/calendarFragment.dart';
import 'package:medicare/ui/fragments/chatFragment.dart';
import 'package:medicare/ui/fragments/homeFragment.dart';
import 'package:medicare/ui/fragments/notificationFragment.dart';
import 'package:medicare/ui/fragments/profileFragemnt.dart';
import 'package:nb_utils/nb_utils.dart';

class DashboardScreen extends StatefulWidget {
  static String tag = '/DashboardScreen';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentWidget = 0;
  List<Widget> widgets = [
    HomeFragment(),
    ChatFragment(),
    CalendarFragment(),
    NotificationFragment(),
    ProfileFragment(),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void dispose() {
    setStatusBarColor(Colors.white);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: widgets[currentWidget],
        bottomNavigationBar: Container(
          color: Colors.white,
          child: showBottomDrawer(),
        ),
      ),
    );
  }

  Widget showBottomDrawer() {
    return BottomNavigationBarWidget(
      index: currentWidget,
      onTap: (index) {
        setState(() {});
        currentWidget = index;
      },
    );
  }
}
