import 'package:flutter/material.dart';
import 'package:medicare/ui/components/profileFormComponent.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:nb_utils/nb_utils.dart';

class AddDependentScreen extends StatefulWidget {
  static String tag = '/AddDependentScreen';

  @override
  AddDependentScreenState createState() => AddDependentScreenState();
}

class AddDependentScreenState extends State<AddDependentScreen> {
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
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: context.height(),
              padding: EdgeInsets.all(16.0),
              decoration: boxDecorationWithRoundedCorners(
                  borderRadius: radiusOnly(topRight: 32)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    backToPreviousWidget(context, black),
                    34.height,
                    Text('Add A Dependent', style: boldTextStyle(size: 24)),
                    16.height,
                    ProfileFormComponent(),
                    48.height,
                  ],
                ),
              ),
            ),
            AppButton(
              width: context.width(),
              color: colorDarkBlue,
              child: Text("Save", style: boldTextStyle(color: white)),
              onTap: () {
                finish(context);
              },
            ).paddingOnly(right: 16, left: 16, bottom: 16),
          ],
        ),
      ),
    );
  }
}
