import 'package:flutter/material.dart';
import 'package:medicare/screens/patient/auth/register/patient_register_screen.dart';
import 'package:medicare/screens/patient/home/navigation_ui.dart';
import 'package:medicare/utils/theme/theme.dart';
import 'package:medicare/utils/widgets/custom_button.dart';
import 'package:medicare/utils/widgets/custom_checkbox.dart';
import 'package:medicare/utils/widgets/snack_bar.dart';

class PatientLoginScreen extends StatefulWidget {
  static String id = "patient_login_screen";
  @override
  _PatientLoginScreenState createState() => _PatientLoginScreenState();
}

class _PatientLoginScreenState extends State<PatientLoginScreen> {
  bool passwordVisible = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() {
    if (email.text.isEmpty && password.text.isEmpty) {
      CustomSnackBar(
        context,
        Text('Fields are required'),
        backgroundColor: error,
      );
    } else if (email.text.isEmpty) {
      CustomSnackBar(
        context,
        Text('Email is required'),
        backgroundColor: error,
      );
    } else if (password.text.isEmpty) {
      CustomSnackBar(
        context,
        Text('Password is required'),
        backgroundColor: error,
      );
    } else if (email.text.length < 8) {
      CustomSnackBar(
        context,
        Text('At least 8 digits ID is required'),
        backgroundColor: error,
      );
    }
    // TODO: do email validation
    else if (password.text.length < 8) {
      CustomSnackBar(
        context,
        Text('At least 8 digits Password is required'),
        backgroundColor: error,
      );
    } else {
      Navigator.pushNamed(context, PatientNavigationUI.id);
      CustomSnackBar(
        context,
        Text('Welcome to Medicare'),
        backgroundColor: success,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png'),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login to your\naccount',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: textBlack,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Container(
                        width: 150,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: primaryColor,
                              height: 4,
                              width: 115,
                            ),
                            Container(
                              color: primaryColor,
                              height: 4,
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.035,
                  ),
                  Form(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: textWhiteGrey,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: TextFormField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: textGrey,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: textWhiteGrey,
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: TextFormField(
                            obscureText: !passwordVisible,
                            controller: password,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: textGrey,
                              ),
                              suffixIcon: IconButton(
                                color: textGrey,
                                splashRadius: 1,
                                icon: Icon(passwordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                                onPressed: togglePassword,
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomCheckbox(),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Remember me',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      child: Text('Login'),
                      onPressed: () => login(),
                      gradient: CustomTheme.buttonGradient,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: textGrey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PatientRegisterScreen()));
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
