import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';

import 'components/notificationTiles.dart';
import 'notification_details.dart';

class DoctorNotificationsScreen extends StatefulWidget {
  static String id = 'doctor_notifications_screen';
  const DoctorNotificationsScreen({Key? key}) : super(key: key);

  @override
  _DoctorNotificationsScreenState createState() =>
      _DoctorNotificationsScreenState();
}

class _DoctorNotificationsScreenState extends State<DoctorNotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorScreen,
      body: ListView.separated(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 12,
          itemBuilder: (context, index) {
            return NotificationTiles(
              title: 'Summit Tech',
              subtitle: 'Thanks for download Medicare app.',
              enable: true,
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => NotificationDetails()),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider();
          }),
    );
  }
}
