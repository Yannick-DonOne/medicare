import 'package:flutter/material.dart';
import 'package:medicare/screens/patient/auth/register/patient_register_screen.dart';
import 'package:medicare/utils/theme/theme.dart';
import 'package:medicare/utils/widgets/custom_button.dart';
import 'package:medicare/utils/widgets/custom_checkbox.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    onPressed: () {},
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
                                builder: (context) => PatientRegisterScreen()));
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
    );
  }
}
