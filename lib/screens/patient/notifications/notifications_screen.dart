import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';

import 'components/notificationTiles.dart';
import 'notificationPage.dart';

class PatientNotificationsScreen extends StatefulWidget {
  static String id = 'notifications_screen';
  const PatientNotificationsScreen({Key? key}) : super(key: key);

  @override
  _PatientNotificationsScreenState createState() =>
      _PatientNotificationsScreenState();
}

class _PatientNotificationsScreenState
    extends State<PatientNotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorScreen,
      // appBar: DefaultAppBar(
      //   title: 'Notifications',
      //   child: DefaultBackButton(),
      // ),
      body: ListView.separated(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 12,
          itemBuilder: (context, index) {
            return NotificationTiles(
              title: 'E-Commerce',
              subtitle: 'Thanks for download E-Commerce app.',
              enable: true,
              // onTap: () {}
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => NotificationPage()),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          }),
    );
  }
}
