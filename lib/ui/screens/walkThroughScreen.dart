import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicare/ui/model/walkThroughData.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/DataProvider.dart';
import 'package:medicare/utils/String.dart';
import 'package:nb_utils/nb_utils.dart';

import 'loginScreen.dart';

class WalkThroughScreen extends StatefulWidget {
  static String tag = '/WalkThroughScreen';

  @override
  _WalkThroughScreenState createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  PageController controller = PageController();

  List<WalkThroughData> list = walkThroughDataList();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(primaryColor,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: list.map((e) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: boxDecorationWithRoundedCorners(
                      boxShape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.greenAccent, Colors.blue.shade600]),
                    ),
                    height: 270,
                    width: 230,
                    child: Image.asset(e.imagePath.validate(),
                        fit: BoxFit.contain),
                  ),
                  48.height,
                  Text(e.title.validate(),
                      style: boldTextStyle(size: 28, color: whiteColor)),
                  16.height,
                  Text(e.subtitle.validate(),
                      style: secondaryTextStyle(color: whiteColor),
                      textAlign: TextAlign.center),
                ],
              ).paddingAll(16.0);
            }).toList(),
          ),
          Positioned(
            bottom: 30,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DotIndicator(pageController: controller, pages: list),
                AppButton(
                  onTap: () {
                    finish(context);
                    return LoginScreen().launch(context);
                  },
                  child: Text(get_started!,
                      style: boldTextStyle(color: primaryColor)),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 16,
            child: Text(mlSkip!, style: boldTextStyle(color: whiteColor))
                .paddingOnly(top: 8, right: 8)
                .onTap(() {
              finish(context);
              LoginScreen().launch(context);
            }),
          ),
        ],
      ),
    );
  }
}
