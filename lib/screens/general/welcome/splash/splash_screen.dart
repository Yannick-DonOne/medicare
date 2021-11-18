import 'package:flutter/material.dart';
import 'package:medicare/screens/general/welcome/onboarding/onboarding_screen.dart';
import 'package:medicare/utils/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  static String id = "splash_screen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushNamed(context, OnboardingScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColorScreen,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: size.height * (1 / 6),
            bottom: size.height * (1 / 32),
            left: 0,
            right: 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundColor: primaryColor,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'MEDI',
                          style: TextStyle(color: primaryColor),
                        ),
                        TextSpan(
                          text: 'CARE',
                          style: TextStyle(color: initial),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Powered by: \n',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'SUMMIT',
                      style: TextStyle(color: Colors.orange),
                    ),
                    TextSpan(
                      text: 'TECH',
                      style: TextStyle(color: initial),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
