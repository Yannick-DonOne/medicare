import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';


class DefaultBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios, color: primaryColor),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}