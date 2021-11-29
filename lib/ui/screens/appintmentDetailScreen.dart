import 'package:flutter/material.dart';
import 'package:medicare/ui/components/appointmentDetailList.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:nb_utils/nb_utils.dart';

class AppointmentDetailScreen extends StatefulWidget {
  static String tag = '/AppointmentDetailScreen';

  @override
  AppointmentDetailScreenState createState() =>
      AppointmentDetailScreenState();
}

class AppointmentDetailScreenState extends State<AppointmentDetailScreen> {
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
              8.height,
              Row(
                children: [
                  backToPreviousWidget(context, black),
                  Text('Appointment Details', style: boldTextStyle(size: 24)),
                ],
              ).paddingAll(16),
              Flexible(child: AppointmentDetailList()),
            ],
          ),
        ),
      ),
    );
  }
}
