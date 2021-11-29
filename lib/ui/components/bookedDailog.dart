import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Image.dart';
import 'package:nb_utils/nb_utils.dart';

class BookedDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(''),
      content: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(appointment_booked.toString(), width: 250, height: 200, fit: BoxFit.cover),
          Text('Appointment Booked', style: boldTextStyle(size: 24)),
          4.height,
          Text('Please check the app carefully to keep your health better', style: secondaryTextStyle(size: 12), textAlign: TextAlign.center),
          16.height,
          AppButton(
            height: 50,
            width: context.width(),
            color: colorDarkBlue,
            child: Text("Add to Calender", style: primaryTextStyle(color: whiteColor)),
            onTap: () {
              finish(context);
              finish(context);
            },
          ),
          16.height,
          Container(
            alignment: Alignment.center,
            height: 50,
            width: context.width(),
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: radius(12),
              border: Border.all(color: colorBlue),
            ),
            child: Text("Close", style: primaryTextStyle(color: colorDarkBlue)),
          ).onTap(() {
            finish(context);
          }),
        ],
      )),
      actions: <Widget>[],
    );
  }
}
