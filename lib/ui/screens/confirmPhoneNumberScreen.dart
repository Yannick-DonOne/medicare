import 'package:flutter/material.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:medicare/utils/Image.dart';
import 'package:medicare/utils/String.dart';
import 'package:nb_utils/nb_utils.dart';

import 'updateProfileScreen.dart';

class ConfirmPhoneNumberScreen extends StatefulWidget {
  static String tag = '/ConfirmPhoneNumberScreen';

  @override
  _ConfirmPhoneNumberScreenState createState() =>
      _ConfirmPhoneNumberScreenState();
}

class _ConfirmPhoneNumberScreenState extends State<ConfirmPhoneNumberScreen> {
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
            padding: EdgeInsets.all(16.0),
            height: context.height(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  56.height,
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    child: Image.asset(verifyindicator!,
                        alignment: Alignment.centerLeft,
                        width: 200,
                        height: 200),
                  ),
                  32.height,
                  Text(contact_msg!, style: boldTextStyle(size: 24)),
                  8.height,
                  Text(contact_sub_msg!, style: secondaryTextStyle(size: 16)),
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
                  24.height,
                  AppButton(
                    width: double.infinity,
                    color: colorDarkBlue,
                    onTap: () => UpdateProfileScreen().launch(context),
                    child: Text(mlSend!, style: boldTextStyle(color: white)),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 30,
            child: backToPrevious(context, blackColor),
          ),
        ],
      ),
    );
  }
}
