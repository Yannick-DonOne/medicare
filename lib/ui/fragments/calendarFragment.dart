import 'package:flutter/material.dart';
import 'package:medicare/ui/components/appointmentDetailListComponent.dart';
import 'package:medicare/ui/components/deliveredDataComponent.dart';
import 'package:medicare/ui/components/medicationComponent.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/String.dart';
import 'package:nb_utils/nb_utils.dart';

class CalendarFragment extends StatefulWidget {
  static String tag = '/CalendarFragment';

  @override
  CalendarFragmentState createState() => CalendarFragmentState();
}

class CalendarFragmentState extends State<CalendarFragment>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          children: [
            Row(
              children: [
                Text(my_activity!,
                        style: boldTextStyle(size: 20, color: white))
                    .expand(),
                Text(mlHistory!, style: secondaryTextStyle(color: white))
                    .paddingRight(8.0),
              ],
            ).paddingAll(16.0),
            8.width,
            Container(
              decoration: boxDecorationWithRoundedCorners(
                  borderRadius: radiusOnly(topRight: 32)),
              child: Column(
                children: [
                  16.height,
                  TabBar(
                    controller: _tabController,
                    labelColor: colorBlue,
                    indicatorColor: colorBlue,
                    indicatorSize: TabBarIndicatorSize.label,
                    unselectedLabelColor: Colors.grey,
                    labelStyle: primaryTextStyle(size: 14),
                    tabs: [
                      Tab(text: appointment),
                      Tab(text: delivery),
                      Tab(text: medication),
                    ],
                  ),
                  TabBarView(
                    controller: _tabController,
                    children: [
                      AppointmentDetailListComponent(),
                      DeliveredDataComponent(),
                      MedicationComponent(),
                    ],
                  ).expand(),
                ],
              ),
            ).expand()
          ],
        ),
      ),
    );
  }
}
