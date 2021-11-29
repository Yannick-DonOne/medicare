import 'package:flutter/material.dart';
import 'package:medicare/ui/model/bookAppointmentData.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/DataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

import 'addPaymentScreen.dart';

class BookAppointmentScreen extends StatefulWidget {
  static String tag = '/BookAppointmentScreen';
  final int? index;

  const BookAppointmentScreen({Key? key, this.index}) : super(key: key);

  @override
  BookAppointmentScreenState createState() => BookAppointmentScreenState();
}

class BookAppointmentScreenState extends State<BookAppointmentScreen> {
  int currentWidget = 0;
  List<BookAppointmentData> data = bookAppointmentDataList();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    currentWidget = widget.index!;
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalObjectKey<NavigatorState>(context);
    String titleNumber = data[currentWidget].id.validate();
    String titleText = data[currentWidget].title.validate();
    double progress = data[currentWidget].progress.validate();

    return WillPopScope(
      key: navigatorKey,
      onWillPop: () async {
        if (currentWidget != 0) {
          if (navigatorKey.currentState!.canPop()) {
            currentWidget--;
            setState(() {});
            navigatorKey.currentState!.pop();
            return false;
          }
          return true;
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                decoration: boxDecorationWithRoundedCorners(
                    borderRadius: radiusOnly(topRight: 32)),
                child: Column(
                  children: <Widget>[
                    8.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.arrow_back_ios, color: blackColor, size: 24)
                            .onTap(() {
                          currentWidget == 0
                              ? Navigator.of(context).pop()
                              : setState(() {
                                  currentWidget--;
                                  widget.index == currentWidget;
                                });
                        }).expand(flex: 1),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Step $titleNumber of 5: ',
                                textAlign: TextAlign.center,
                                style: boldTextStyle(color: colorDarkBlue)),
                            Text(titleText,
                                textAlign: TextAlign.center,
                                style: boldTextStyle(color: Colors.grey)),
                          ],
                        ).expand(flex: 8),
                        Icon(Icons.home_outlined, color: blackColor, size: 24)
                            .expand(flex: 1),
                      ],
                    ).paddingAll(16.0),
                    8.height,
                    LinearProgressIndicator(
                      minHeight: 2.0,
                      backgroundColor: colorLightGrey,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(colorDarkBlue),
                      value: progress,
                    ),
                    8.height,
                    data[currentWidget].widget.validate().expand(),
                  ],
                ),
              ),
              AppButton(
                height: 50,
                width: context.width(),
                color: colorDarkBlue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Continue", style: boldTextStyle(color: white)),
                    8.width,
                    Icon(Icons.arrow_forward_ios, color: whiteColor, size: 12),
                  ],
                ),
                onTap: () {
                  setState(() {
                    currentWidget++;
                  });
                  if (currentWidget > 4) {
                    setState(() {
                      currentWidget--;
                    });
                    currentWidget = 0;
                    finish(context);
                    AddPaymentScreen().launch(context);
                  }
                },
              ).paddingOnly(right: 16, left: 16, bottom: 16)
            ],
          ),
        ),
      ),
    );
  }
}
