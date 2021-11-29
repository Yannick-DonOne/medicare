import 'package:flutter/material.dart';
import 'package:medicare/ui/model/serviceData.dart';
import 'package:medicare/ui/screens/addToCartScreen.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/DataProvider.dart';
import 'package:medicare/utils/Image.dart';
import 'package:medicare/utils/String.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeTopComponent extends StatefulWidget {
  static String tag = '/HomeTopComponent';

  @override
  _HomeTopComponentState createState() => _HomeTopComponentState();
}

class _HomeTopComponentState extends State<HomeTopComponent> {
  int counter = 2;
  List<ServicesData> data = serviceDataList();

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
    return Container(
      height: 260,
      width: context.width(),
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: boxDecorationWithRoundedCorners(
        backgroundColor: colorDarkBlue,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.elliptical(MediaQuery.of(context).size.width, 80.0),
        ),
      ),
      child: Column(
        children: [
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                      child: Image.asset(profile_picture!),
                      radius: 22,
                      backgroundColor: colorCyan),
                  8.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(profile_name!,
                          style: boldTextStyle(color: whiteColor)),
                      4.height,
                      Text(welcome!,
                          style: secondaryTextStyle(
                              color: white.withOpacity(0.7))),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.search, color: white, size: 24),
                  10.width,
                  Stack(
                    children: [
                      Icon(Icons.shopping_bag_outlined, color: white, size: 24),
                      Positioned(
                        top: 0.0,
                        right: 0.0,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: boxDecorationWithRoundedCorners(
                              backgroundColor: colorRed),
                          constraints:
                              BoxConstraints(minWidth: 12, minHeight: 12),
                          child: Text(
                            counter.toString(),
                            style: boldTextStyle(size: 8, color: white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ).onTap(() {
                    AddToCartScreen().launch(context);
                  }),
                ],
              )
            ],
          ).paddingOnly(right: 16.0, left: 16.0),
          Container(
            margin: EdgeInsets.only(right: 16.0, left: 16.0),
            transform: Matrix4.translationValues(0, 16.0, 0),
            alignment: Alignment.center,
            decoration: boxDecorationRoundedWithShadow(12),
            child: Wrap(
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              spacing: 8.0,
              children: data.map((e) {
                return Container(
                  constraints: BoxConstraints(minWidth: context.width() * 0.25),
                  padding: EdgeInsets.only(top: 20, bottom: 20.0),
                  child: Column(
                    children: [
                      Image.asset(e.image!,
                          width: 28, height: 28, fit: BoxFit.fill),
                      8.height,
                      Text(e.title.toString(),
                          style: boldTextStyle(size: 12),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ).onTap(() {
                  e.widget.launch(context);
                });
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
