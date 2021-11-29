import 'package:flutter/material.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Image.dart';
import 'package:medicare/utils/String.dart';
import 'package:nb_utils/nb_utils.dart';

import 'confirmAppointmentComponent.dart';

class FailedDailog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(''),
      content: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(appointment_booked.toString(),
                width: 150, height: 150),
            Text('Booking Failed !!!',
                style: boldTextStyle(size: 24, color: colorRed)),
            4.height,
            Text(booking_fail_message!, style: secondaryTextStyle(size: 12)),
            12.height,
            AppButton(
                height: 50,
                width: 350,
                color: colorDarkBlue,
                child: Text("Back to Booking",
                    style: primaryTextStyle(color: whiteColor)),
                onTap: () {
                  ConfirmAppointmentComponent().launch(context);
                }).paddingOnly(bottom: 12.0),
          ],
        ),
      ),
      actions: <Widget>[],
    );
  }
}
