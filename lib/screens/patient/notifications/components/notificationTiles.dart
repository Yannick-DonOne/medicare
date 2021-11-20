import 'package:flutter/material.dart';

class NotificationTiles extends StatelessWidget {
  final String title, subtitle;
  final VoidCallback onTap;
  final bool enable;
  const NotificationTiles({
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.enable,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('logo'), fit: BoxFit.cover),
        ),
        child: Image.asset('assets/images/logo.png'),
      ),
      title: Text(
        title,
        // style: TextStyle(color: kDarkColor),
      ),
      subtitle: Text(
        subtitle,
        // style: TextStyle(color: kLightColor),
      ),
      onTap: onTap,
      enabled: enable,
    );
  }
}
