import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:medicare/utils/Image.dart';
import 'package:medicare/utils/String.dart';
import 'package:nb_utils/nb_utils.dart';

import 'confirmPhoneNumberScreen.dart';

class RegistrationScreen extends StatefulWidget {
  static String tag = '/RegistrationScreen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 250),
              padding: EdgeInsets.only(right: 16.0, left: 16.0),
              decoration: boxDecorationWithRoundedCorners(
                  borderRadius: radiusOnly(topRight: 32)),
              height: context.height(),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    48.height,
                    Text(register!, style: boldTextStyle(size: 28)),
                    8.height,
                    Text('Register to continue',
                        style: secondaryTextStyle(size: 16)),
                    16.height,
                    Row(
                      children: [
                        AppTextField(
                          textFieldType: TextFieldType.PHONE,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            labelText: phoneNumber,
                            labelStyle: secondaryTextStyle(size: 16),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: colorLightGrey),
                            ),
                          ),
                        ).expand(),
                      ],
                    ),
                    16.height,
                    AppTextField(
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: InputDecoration(
                        labelText: mlPassword!,
                        labelStyle: secondaryTextStyle(size: 16),
                        prefixIcon: Icon(Icons.lock_outline, size: 20),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: colorLightGrey),
                        ),
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
                          borderSide: BorderSide(color: colorLightGrey),
                        ),
                      ),
                    ),
                    32.height,
                    AppButton(
                      width: double.infinity,
                      color: primaryColor,
                      onTap: () {
                        return ConfirmPhoneNumberScreen().launch(context);
                      },
                      child:
                          Text(register!, style: boldTextStyle(color: white)),
                    ),
                    // TODO: Implement social media register.
                    // 20.height,
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: Text(login_with!,
                    //       style: secondaryTextStyle(size: 16)),
                    // ),
                    // 20.height,
                    // SocialAccountsComponent(),
                    32.height,
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 75),
              width: double.infinity,
              child: Image.asset(
                register_indicator!,
                alignment: Alignment.center,
                width: 200,
                height: 200,
              ),
            ),
            Positioned(
              top: 30,
              child: backToPrevious(context, whiteColor),
            ),
          ],
        ).center(),
      ),
    );
  }
}
