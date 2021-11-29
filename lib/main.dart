// @dart=2.9
import 'package:flutter/material.dart';

import 'ui/screens/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicare',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
