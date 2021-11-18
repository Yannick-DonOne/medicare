import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: <Widget>[
          Container(
            child: SafeArea(
              child: Container(),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            child: Divider(
              color: primaryColor,
              thickness: 1,
            ),
          ),
          ListTile(
            title: Text("Home".toUpperCase()),
            leading: Icon(
              Icons.home,
              color: primaryColor,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text("Profile".toLowerCase()),
            leading: Icon(
              Icons.person,
              color: primaryColor,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text("Drug".toLowerCase()),
            leading: Icon(
              Icons.medication,
              color: primaryColor,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text("Dashboard".toLowerCase()),
            leading: Icon(
              Icons.dashboard,
              color: primaryColor,
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text("Logout".toLowerCase()),
            leading: Icon(
              Icons.power_settings_new_rounded,
              color: primaryColor,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
