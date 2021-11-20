import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget child;
  // final action;
  const DefaultAppBar({
    required this.title,
    required this.child,
    // required this.action,
  });

  @override
  Size get preferredSize => Size.fromHeight(56.0);
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyle(color: primaryColor)),
      centerTitle: true,
      backgroundColor: whiteColor,
      elevation: 2,
      automaticallyImplyLeading: false,
      iconTheme: IconThemeData(color: kPrimaryColor),
      leading: child,
      // actions: action,
    );
  }
}
