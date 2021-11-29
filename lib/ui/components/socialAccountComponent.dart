import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Image.dart';
import 'package:nb_utils/nb_utils.dart';

class SocialAccountsComponent extends StatefulWidget {
  static String tag = '/SocialAccountsComponent';

  @override
  SocialAccountsComponentState createState() =>
      SocialAccountsComponentState();
}

class SocialAccountsComponentState extends State<SocialAccountsComponent> {
  List<String?> data = <String?>[
    logo_google,
    logo_fb,
    logo_ios
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: data.map((e) {
        return Container(
          margin: EdgeInsets.only(right: 8, left: 8),
          padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: radius(12),
            border: Border.all(color: colorLightGrey),
          ),
          child: Image.asset(e.validate(), height: 24, width: 24),
        ).expand();
      }).toList(),
    );
  }
}
