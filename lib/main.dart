import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/dashboard/dashboard_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/home/navigation_ui.dart';
import 'screens/notifications/notifications_screen.dart';
import 'screens/profile/profile_screen.dart';
import 'screens/settings/settings_screen.dart';
import 'screens/welcome/onboarding/onboarding_screen.dart';
import 'screens/welcome/option/option_screen.dart';
import 'screens/welcome/splash/splash_screen.dart';
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
          NavigationUI.id: (context) => NavigationUI(),
          HomeScreen.id: (context) => HomeScreen(),
          DashBoardScreen.id: (context) => DashBoardScreen(),
          NotificationsScreen.id: (context) => NotificationsScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
          SettingScreen.id: (context) => SettingScreen(),
        },
      ),
    );
  }
}
