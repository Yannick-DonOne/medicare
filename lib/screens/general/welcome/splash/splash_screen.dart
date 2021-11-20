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
            bottom: size.height * (1 / 32),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 150,
                        width: 150,
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
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
