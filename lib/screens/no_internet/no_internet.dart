import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';

class NoInternetScreen extends StatefulWidget {
  static String id = 'no_internet';
  @override
  _NoInternetScreenState createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image.asset('assets/no_int.gif'),
          Container(
              margin: EdgeInsets.only(bottom: 60),
              child: Icon(
                Icons.wifi_off_rounded,
                size: 100,
                color: primaryColor,
              )),
          Text(
            "There is no internet. \nPlease check your internet connection.",
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 30),
            // child: CustomButton(
            //   onPressed: () {
            //     // AppSettings.openWIFISettings();
            //   },
            //   label: 'Check',
            // ),
          )
        ],
      ),
    );
  }
}
