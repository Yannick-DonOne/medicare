import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:medicare/ui/screens/forgetPasswordScreen.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Image.dart';
import 'package:medicare/utils/String.dart';
import 'package:nb_utils/nb_utils.dart';

import 'dashboardScreen.dart';
import 'registrationScreen.dart';

class LoginScreen extends StatefulWidget {
  static String tag = '/LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 250),
            height: context.height(),
            decoration: boxDecorationWithRoundedCorners(
                borderRadius: radiusOnly(topRight: 32)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  60.height,
                  Text(login_title!, style: secondaryTextStyle(size: 16)),
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
                  AppTextField(
                    textFieldType: TextFieldType.PASSWORD,
                    decoration: InputDecoration(
                      labelText: mlPassword!,
                      labelStyle: secondaryTextStyle(size: 16),
                      prefixIcon: Icon(Icons.lock_outline),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: colorLightGrey),
                      ),
                    ),
                  ),
                  8.height,
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(forget_password!,
                            style: secondaryTextStyle(size: 16))
                        .onTap(() {
                      ForgetPasswordScreen().launch(context);
                    }),
                  ),
                  24.height,
                  AppButton(
                    color: primaryColor,
                    width: double.infinity,
                    onTap: () {
                      finish(context);
                      DashboardScreen().launch(context);
                    },
                    child: Text(login!, style: boldTextStyle(color: white)),
                  ),

                  // TODO: Implement social media logins.
                  // 22.height,
                  // Text(login_with!, style: secondaryTextStyle(size: 16))
                  //     .center(),
                  // 22.height,
                  // SocialAccountsComponent(),
                  22.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dont_have_account!,
                        style: primaryTextStyle(),
                      ),
                      8.width,
                      Text(
                        register!,
                        style: boldTextStyle(
                            color: colorBlue,
                            decoration: TextDecoration.underline),
                      ).onTap(() {
                        RegistrationScreen().launch(context);
                      }),
                    ],
                  ),
                  32.height,
                ],
              ).paddingOnly(left: 16, right: 16),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 75),
            width: context.width(),
            child: Image.asset(
              register_indicator!,
              alignment: Alignment.center,
              width: 200,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
