import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medicare/ui/components/profileFormComponent.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:nb_utils/nb_utils.dart';

import 'dashboardScreen.dart';

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
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
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  54.height,
                  Text('Update your information',
                      style: boldTextStyle(size: 24)),
                  32.height,
                  ProfileFormComponent(),
                  42.height,
                ],
              ),
            ),
          ),
          Positioned(top: 30, child: backToPrevious(context, blackColor)),
          Positioned(
            bottom: 8,
            left: 16,
            right: 16,
            child: AppButton(
              height: 50,
              width: context.width(),
              color: primaryColor,
              onTap: () {
                finish(context);
                finish(context);
                finish(context);
                finish(context);
                return DashboardScreen().launch(context);
              },
              child: Text('Save', style: boldTextStyle(color: white)),
            ),
          ),
        ],
      ),
    );
  }
}
