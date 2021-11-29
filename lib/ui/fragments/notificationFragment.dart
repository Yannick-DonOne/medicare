import 'package:flutter/material.dart';
import 'package:medicare/ui/components/notificationComponent.dart';
import 'package:medicare/ui/model/notificationData.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/DataProvider.dart';
import 'package:medicare/utils/String.dart';
import 'package:nb_utils/nb_utils.dart';

class NotificationFragment extends StatefulWidget {
  static String tag = '/NotificationFragment';

  @override
  NotificationFragmentState createState() => NotificationFragmentState();
}

class NotificationFragmentState extends State<NotificationFragment> {
  List<NotificationData> data = notificationDataList();
  bool checked = false;
  int? newNotification = 3;
  Color customColor = colorBlue;
  bool valuefirst = false;
  bool valuesecond = false;

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Container(
          decoration: boxDecorationWithRoundedCorners(
              borderRadius: radiusOnly(topRight: 32)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(notification!, style: boldTextStyle(size: 20)),
                      8.width,
                      checked == false
                          ? Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: boxDecorationWithRoundedCorners(
                                backgroundColor: Colors.blue.shade500,
                                boxShape: BoxShape.circle,
                              ),
                              child: Text(newNotification.toString(),
                                  style: secondaryTextStyle(color: white)),
                            ).onTap(() {
                              openBottomSheet();
                            })
                          : Container(),
                    ],
                  ).expand(),
                  Container(
                      padding: EdgeInsets.all(6),
                      decoration: boxDecorationWithRoundedCorners(
                        boxShape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      ),
                      child: Icon(Icons.settings,
                          color: colorDarkBlue, size: 20)),
                ],
              ).paddingAll(16.0),
              NotificationComponent().expand(),
              8.height,
            ],
          ),
        ),
      ),
    );
  }

  void openBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: radiusOnly(topRight: 12, topLeft: 12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: context.width() / 2.5,
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: Colors.blue,
                    borderRadius: radius(12.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Mark all read",
                          style: secondaryTextStyle(color: white, size: 14)),
                      4.width,
                      Icon(Icons.check_box, color: white, size: 20).onTap(
                        () {
                          setState(() {
                            checked = true;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: context.width() / 2.5,
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  decoration: boxDecorationWithRoundedCorners(
                      border: Border.all(color: Colors.blue),
                      borderRadius: radius(12.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Delete all",
                          style: secondaryTextStyle(color: Colors.blue)),
                      4.width,
                      Icon(Icons.delete_outline, color: Colors.blue, size: 20)
                          .paddingBottom(4.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
