import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/general/option/option_screen.dart';
import 'screens/general/welcome/onboarding/onboarding_screen.dart';
import 'screens/general/welcome/splash/splash_screen.dart';
import 'screens/patient/auth/login/patient_login_screen.dart';
import 'screens/patient/auth/register/patient_register_screen.dart';
import 'screens/patient/dashboard/dashboard_screen.dart';
import 'screens/patient/home/home_screen.dart';
import 'screens/patient/home/navigation_ui.dart';
import 'screens/patient/notifications/notifications_screen.dart';
import 'screens/patient/profile/profile_screen.dart';
import 'screens/patient/settings/settings_screen.dart';
import 'services/data_connectivity_service.dart';

void main() => runApp(MyApp());

// TODO: generate logo icons.
// TODO: rename application.
class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<NetworkStatus>(
      initialData: NetworkStatus.Offline,
      create: (context) =>
          NetworkStatusService().networkStatusController.stream,
      child: MaterialApp(
        title: 'Medicare',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "GoogleSans",
          primarySwatch: Colors.red,
        ),
        home: SplashScreen(),
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          OnboardingScreen.id: (context) => OnboardingScreen(),
          OptionScreen.id: (context) => OptionScreen(),
          PatientLoginScreen.id: (context) => PatientLoginScreen(),
          PatientRegisterScreen.id: (context) => PatientRegisterScreen(),
          PatientNavigationUI.id: (context) => PatientNavigationUI(),
          PatientHomeScreen.id: (context) => PatientHomeScreen(),
          PatientDashBoardScreen.id: (context) => PatientDashBoardScreen(),
          PatientNotificationsScreen.id: (context) =>
              PatientNotificationsScreen(),
          PatientProfileScreen.id: (context) => PatientProfileScreen(),
          PatientSettingScreen.id: (context) => PatientSettingScreen(),
        },
      ),
    );
  }
}
