import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:medicare/utils/String.dart';
import 'package:nb_utils/nb_utils.dart';

import 'authenticationScreen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static String tag = '/MLForgetPasswordScreen';

  @override
  _ForgetPasswordScreenState createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 24.0),
            decoration: boxDecorationWithRoundedCorners(
                borderRadius: radiusOnly(topRight: 32)),
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  80.height,
                  Text(forgetPassword!, style: boldTextStyle(size: 24)),
                  8.height,
                  Text(forget_password_msg!, style: secondaryTextStyle()),
                  16.height,
                  Row(
                    children: [
                      AppTextField(
                        textFieldType: TextFieldType.PHONE,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: phoneNumber!,
                          labelStyle: secondaryTextStyle(size: 16),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: colorLightGrey),
                          ),
                        ),
                      ).expand(),
                    ],
                  ),
                  16.height,
                  AppButton(
                    width: double.infinity,
                    color: primaryColor,
                    onTap: () => AuthenticationScreen().launch(context),
                    child: Text('Send', style: boldTextStyle(color: white)),
                  ),
                ],
              ).paddingOnly(right: 16.0, left: 16.0),
            ),
          ),
          Positioned(
            top: 30,
            child: backToPrevious(context, black),
          ),
        ],
      ),
    );
  }
}
