import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  static String id = "onboarding_screen";
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Onboarding Screen'),
        ),
      ),
    );
  }
}
