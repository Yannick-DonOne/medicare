import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String id = "splash_screen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Splash screen'),
        ),
      ),
    );
  }
}
