import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
    static String id = 'notifications_screen';
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Notifications Screen'),
        ),
      ),
    );
  }
}
