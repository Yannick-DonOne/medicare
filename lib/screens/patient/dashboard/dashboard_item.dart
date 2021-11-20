import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';

class DashBoardItem extends StatelessWidget {
  const DashBoardItem({
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(0),
        color: whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              icon,
              color: primaryColor,
              size: 80,
            ),
            Text(
              label,
              style: TextStyle(
                color: black.withOpacity(0.8),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
