import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Gradient gradient;

  CustomButton(
      {required this.onPressed, required this.child, required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          child: Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(32.0),
              gradient: CustomTheme.buttonGradient,
            ),
            constraints: BoxConstraints(
              maxWidth: 200.0,
              minHeight: 50.0,
            ),
            alignment: Alignment.center,
            child: child,
          ),
          splashColor: primaryColor,
          padding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
      ),
    );
  }
}
