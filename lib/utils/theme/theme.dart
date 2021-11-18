import 'package:flutter/material.dart';

import 'light_color.dart';

class AppTheme {
  const AppTheme();
  static ThemeData lightTheme = ThemeData(
      backgroundColor: LightColor.background,
      primaryColor: LightColor.purple,
      cardTheme: CardTheme(color: LightColor.background),
      // ignore: deprecated_member_use
      textTheme: TextTheme(display1: TextStyle(color: LightColor.black)),
      iconTheme: IconThemeData(color: LightColor.iconColor),
      bottomAppBarColor: LightColor.background,
      dividerColor: LightColor.grey,
      primaryTextTheme: TextTheme(
          // ignore: deprecated_member_use
          body1: TextStyle(color: LightColor.titleTextColor)));

  static TextStyle titleStyle =
      const TextStyle(color: LightColor.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle =
      const TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);

  static List<BoxShadow> shadow = <BoxShadow>[
    BoxShadow(color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 15),
  ];

  static EdgeInsets padding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static EdgeInsets hPadding = const EdgeInsets.symmetric(
    horizontal: 10,
  );

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}

const Color black = Color(0xFF000000);

const Color whiteColor = Color(0xFFFFFFFF);

const Color initial = Color.fromRGBO(23, 43, 77, 1.0);

Color primaryColor = Color(0xFF12b7ef);

Color secondaryColor = Color(0xFF02dce5);

Color transparentColor = Colors.transparent;

const Color secondary = Color.fromRGBO(247, 250, 252, 1.0);

const Color grey = Colors.grey;

const Color info = Color.fromRGBO(17, 205, 239, 1.0);

const Color error = Color.fromRGBO(245, 54, 92, 1.0);

const Color success = Color.fromRGBO(45, 206, 137, 1.0);

const Color warning = Color.fromRGBO(251, 99, 64, 1.0);

const Color header = Color.fromRGBO(82, 95, 127, 1.0);

Color bgColorScreen = Colors.grey.shade200;

const Color border = Color.fromRGBO(202, 209, 215, 1.0);

const Color inputSuccess = Color.fromRGBO(123, 222, 177, 1.0);

const Color inputError = Color.fromRGBO(252, 179, 164, 1.0);

const Color muted = Color.fromRGBO(136, 152, 170, 1.0);

const Color text = Color.fromRGBO(50, 50, 93, 1.0);

class CustomTheme {
  const CustomTheme();

  static Color loginGradientEnd = Color.fromRGBO(50, 75, 205, 1);
  static Color loginGradientStart = Colors.purple.shade900;
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static LinearGradient primaryGradient = LinearGradient(
    colors: <Color>[loginGradientStart, loginGradientEnd],
    stops: <double>[0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

//for chat
InputDecoration textFieldDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black54, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );
}

const kDefaultPadding = 20.0;

const kPrimaryColor = Color(0XFF4F80C8);
const kTextColor = Color(0XFF364861);
const kTextLightColor = Color(0XFF374457);
const kIndicatorColor = Color(0XFFCBCCD5);
const kBackgroundColor = Color(0XFFF6F8FF);
