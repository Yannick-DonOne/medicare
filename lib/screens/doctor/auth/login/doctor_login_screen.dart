import 'package:flutter/material.dart';
import 'package:medicare/screens/doctor/home/doctor_navigation_ui.dart';
import 'package:medicare/utils/theme/theme.dart';
import 'package:medicare/utils/widgets/custom_button.dart';

import 'package:medicare/utils/widgets/snack_bar.dart';

class DoctorLoginScreen extends StatefulWidget {
  static String id = 'doctor_login_screen';
  final String? message;
  final bool? leading;

  DoctorLoginScreen({this.message, this.leading});

  @override
  _DoctorLoginScreenState createState() => _DoctorLoginScreenState();
}

class _DoctorLoginScreenState extends State<DoctorLoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  bool passwordVisible = false;

  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController doctorID = TextEditingController();
  TextEditingController password = TextEditingController();

  void submitForm() async {
    if (doctorID.text.isEmpty && password.text.isEmpty) {
      CustomSnackBar(
        context,
        Text('Fields are required'),
        backgroundColor: error,
      );
    } else if (doctorID.text.isEmpty) {
      CustomSnackBar(
        context,
        Text('Doctor ID is required'),
        backgroundColor: error,
      );
    } else if (password.text.isEmpty) {
      CustomSnackBar(
        context,
        Text('Password is required'),
        backgroundColor: error,
      );
    } else if (doctorID.text.length < 8) {
      CustomSnackBar(
        context,
        Text('At least 8 digits ID is required'),
        backgroundColor: error,
      );
    } else if (password.text.length < 8) {
      CustomSnackBar(
        context,
        Text('At least 8 digits Password is required'),
        backgroundColor: error,
      );
    } else {
      Navigator.pushNamed(context, DoctorNavigationUI.id);
      CustomSnackBar(
        context,
        Text('Welcome to Medicare'),
        backgroundColor: success,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo.png',
                    // height: 200,
                    // width: 200,
                  ),
                  Text(
                    "Medicare",
                    style: TextStyle(
                      fontSize: 25,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 25,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: doctorID,
                    autofocus: false,
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                      hintText: 'Enter Doctor ID',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                    // onSaved: (String? value) {
                    //   setState(() {
                    //     doctorID = value;
                    //   });
                    // },
                    validator: (value) =>
                        value!.isEmpty ? "Please enter ID" : null,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor, width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      suffixIcon: IconButton(
                        color: textGrey,
                        splashRadius: 1,
                        icon: Icon(passwordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: togglePassword,
                      ),
                    ),
                    obscureText: true,
                    // onSaved: (String value) {
                    //   setState(() {
                    //     password = value;
                    //   });
                    // },
                    validator: (value) =>
                        value!.isEmpty ? "Please enter password" : null,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomButton(
                    child: Text('Login'),
                    gradient: CustomTheme.buttonGradient,
                    onPressed: () => submitForm(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
