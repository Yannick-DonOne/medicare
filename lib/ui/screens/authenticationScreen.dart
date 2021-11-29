import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:medicare/utils/String.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import 'loginScreen.dart';

class AuthenticationScreen extends StatefulWidget {
  static String tag = '/AuthenticationScreen';

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double buttonOpacity = 1.0;
  double buttonHeight = 50.0;
  double containerOpacity = 0.0;
  String? phoneNumber = '+237 671 305 865';

  Duration get duration => controller.duration! * controller.value;

  bool get expired => duration.inSeconds == 0;
  int endTime = DateTime.now().millisecond + 1000 * 30;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );
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
            height: context.height(),
            decoration: boxDecorationWithRoundedCorners(
                borderRadius: radiusOnly(topRight: 32)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  64.height,
                  Text(enter_code!, style: boldTextStyle(size: 24)),
                  8.height,
                  createRichText(list: [
                    TextSpan(
                        text: authentication_msg!, style: secondaryTextStyle()),
                    TextSpan(
                        text: phoneNumber!,
                        style: boldTextStyle(color: colorDarkBlue)),
                  ]),
                  16.height,
                  otpField(),
                  24.height,
                  Row(
                    children: [
                      Text(have_no_code!, style: primaryTextStyle()),
                      8.width,
                      Text('Re-send',
                          style: boldTextStyle(
                              color: colorDarkBlue,
                              decoration: TextDecoration.underline)),
                      Text('01:58', textAlign: TextAlign.right).expand()
                    ],
                  ),
                  24.height,
                  Container(
                    height: buttonHeight,
                    child: AppButton(
                      width: double.infinity,
                      color: colorDarkBlue,
                      onTap: () {
                        setState(() {
                          buttonOpacity = 0.0;
                          buttonHeight = 0.0;
                          containerOpacity = 1.0;
                        });
                      },
                      child: Text(done!, style: boldTextStyle(color: white)),
                    ),
                  ).opacity(opacity: buttonOpacity),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Divider(height: 0.5),
                      32.height,
                      Text(add_password!, style: boldTextStyle(size: 20)),
                      8.height,
                      AppTextField(
                        textFieldType: TextFieldType.PASSWORD,
                        decoration: InputDecoration(
                          labelText: mlPassword!,
                          labelStyle: secondaryTextStyle(size: 16),
                          prefixIcon: Icon(Icons.lock_outline, size: 20),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: colorLightGrey)),
                        ),
                      ),
                      16.height,
                      AppTextField(
                        textFieldType: TextFieldType.PASSWORD,
                        decoration: InputDecoration(
                          labelText: reenter_password!,
                          labelStyle: secondaryTextStyle(size: 16),
                          prefixIcon: Icon(Icons.lock_outline, size: 20),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: colorLightGrey)),
                        ),
                      ),
                      32.height,
                      AppButton(
                        width: double.infinity,
                        color: colorDarkBlue,
                        onTap: () => LoginScreen().launch(context),
                        child: Text(done!, style: boldTextStyle(color: white)),
                      ),
                    ],
                  ).opacity(opacity: containerOpacity),
                ],
              ).paddingAll(16.0),
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

  Widget otpField() {
    return Wrap(
      children: <Widget>[
        OTPTextField(
          length: 6,
          width: double.infinity,
          fieldWidth: 35,
          style: boldTextStyle(size: 24),
          textFieldAlignment: MainAxisAlignment.spaceBetween,
          fieldStyle: FieldStyle.underline,
          onCompleted: (pin) {
            print("Completed: " + pin);
          },
        ),
      ],
    );
  }
}
