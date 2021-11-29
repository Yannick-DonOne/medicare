import 'package:flutter/material.dart';
import 'package:medicare/ui/components/addPaymentListComponent.dart';
import 'package:medicare/ui/components/bookedDailog.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:nb_utils/nb_utils.dart';

class AddPaymentScreen extends StatefulWidget {
  static String tag = '/AddPaymentScreen';

  @override
  AddPaymentScreenState createState() => AddPaymentScreenState();
}

class AddPaymentScreenState extends State<AddPaymentScreen> {
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
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 90),
              decoration: boxDecorationWithRoundedCorners(
                  borderRadius: radiusOnly(topRight: 32)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Add a Payment', style: boldTextStyle(size: 24)),
                  8.height,
                  Text('Choose your payment method for hospital clinic visit',
                      style: secondaryTextStyle(size: 16)),
                  16.height,
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        AddPaymentListComponent(),
                        8.height,
                        Container(
                          padding: EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          decoration: boxDecorationWithRoundedCorners(
                              borderRadius: radius(12),
                              border: Border.all(color: colorBlue)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Add New card',
                                  style:
                                      primaryTextStyle(color: colorDarkBlue)),
                              8.width,
                              Icon(Icons.add_circle_outline,
                                  color: colorDarkBlue, size: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ).paddingOnly(right: 16.0, left: 16.0),
            ),
            Positioned(
              top: 32.0,
              left: 24.0,
              child: backToPreviousWidget(context, black),
            ),
            Positioned(
              bottom: 8,
              right: 16.0,
              left: 16.0,
              child: Column(
                children: [
                  8.height,
                  AppButton(
                    width: context.width(),
                    color: colorDarkBlue,
                    child: Text("Save", style: boldTextStyle(color: white)),
                    onTap: () {
                      _showDialog(context);
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _showDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return BookedDialog();
        });
  }
}
