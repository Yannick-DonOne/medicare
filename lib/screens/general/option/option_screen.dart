import 'package:flutter/material.dart';
import 'package:medicare/screens/patient/auth/register/patient_register_screen.dart';
import 'package:medicare/utils/theme/theme.dart';
import 'package:medicare/utils/widgets/custom_button.dart';

class OptionScreen extends StatefulWidget {
  static String id = 'option_screen';
  @override
  _OptionScreenState createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: CustomTheme.primaryGradient,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo.png', width: 200, height: 150),
              Text(
                'Medicare'.toUpperCase(),
                style: TextStyle(
                  fontSize: 20,
                  color: whiteColor,
                ),
              ),
              SizedBox(height: 100),
              Text('Continue as'.toUpperCase()),
              CustomButton(
                onPressed: () {},
                child: Text(
                  'Doctor',
                  style: TextStyle(color: Colors.white),
                ),
                gradient: CustomTheme.buttonGradient,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, PatientRegisterScreen.id);
                },
                child: Text(
                  'Patient',
                  style: TextStyle(color: Colors.white),
                ),
                gradient: CustomTheme.buttonGradient,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
