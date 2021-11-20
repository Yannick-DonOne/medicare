import 'package:flutter/material.dart';
import 'package:medicare/screens/patient/auth/login/patient_login_screen.dart';
import 'package:medicare/screens/patient/home/navigation_ui.dart';
import 'package:medicare/utils/theme/theme.dart';
import 'package:medicare/utils/widgets/custom_button.dart';
import 'package:medicare/utils/widgets/custom_checkbox.dart';

class PatientRegisterScreen extends StatefulWidget {
  static String id = "patient_register_screen";
  @override
  _PatientRegisterScreenState createState() => _PatientRegisterScreenState();
}

class _PatientRegisterScreenState extends State<PatientRegisterScreen> {
  bool passwordVisible = false;
  bool passwordConfrimationVisible = false;
  void togglePassword() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 40.0, 24.0, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Register new\naccount',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/images/accent.png',
                      width: 99,
                      height: 4,
                    ),
                  ],
                ),
                SizedBox(
                  height: 48,
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
                        height: 32,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: textWhiteGrey,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: TextFormField(
                          obscureText: !passwordVisible,
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
                      SizedBox(
                        height: 32,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: textWhiteGrey,
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: TextFormField(
                          obscureText: !passwordConfrimationVisible,
                          decoration: InputDecoration(
                            hintText: 'Password Confirmation',
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: textGrey,
                            ),
                            suffixIcon: IconButton(
                              color: textGrey,
                              splashRadius: 1,
                              icon: Icon(passwordConfrimationVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined),
                              onPressed: () {
                                setState(() {
                                  passwordConfrimationVisible =
                                      !passwordConfrimationVisible;
                                });
                              },
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
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomCheckbox(),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'By creating an account, you agree to our',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: textGrey,
                          ),
                        ),
                        Text(
                          'Terms & Conditions',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                CustomButton(
                  child: Text('Register'),
                  onPressed: () {
                    Navigator.pushNamed(context, PatientNavigationUI.id);
                  },
                  gradient: CustomTheme.buttonGradient,
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: textGrey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, PatientLoginScreen.id);
                      },
                      child: Text(
                        'Login',
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
    );
  }
}
