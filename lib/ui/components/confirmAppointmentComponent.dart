import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medicare/ui/screens/addVoucherScreen.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'appointmentDetailList.dart';

class ConfirmAppointmentComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Text('Confirm Appointment', style: boldTextStyle(size: 24))
                  .paddingLeft(16),
              8.height,
              Text('Find the service you are', style: secondaryTextStyle())
                  .paddingLeft(16),
              16.height,
              AppointmentDetailList(),
            ],
          ),
        ),
        Text(
          'Add Voucher',
          style: boldTextStyle(
              color: colorDarkBlue, decoration: TextDecoration.underline),
        ).paddingOnly(bottom: 70, right: 16).onTap(() {
          AddVoucherScreen().launch(context);
        }),
      ],
    );
  }
}
