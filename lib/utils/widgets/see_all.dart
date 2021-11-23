import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';

class SeeAll extends StatelessWidget {
  final VoidCallback onTap;
  const SeeAll({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("See All", style: TextStyle(color: primaryColor)),
          SizedBox(width: 2),
          Icon(
            Icons.list,
            color: primaryColor,
            size: 20,
          ),
        ],
      ),
    );
  }
}
