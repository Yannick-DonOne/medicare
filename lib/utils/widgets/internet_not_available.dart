import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';

class NoInternet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.center,
      color: whiteColor,
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('Check your Internet Connection',
              style: TextStyle(color: warning, fontSize: 18)),
          SizedBox(width: 5),
          Image.asset('assets/images/no_con.gif', height: 30),
        ],
      ),
    );
  }
}
