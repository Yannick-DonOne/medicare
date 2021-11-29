import 'package:flutter/material.dart';
import 'package:medicare/ui/model/departmentData.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:medicare/utils/DataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class ClinicVisitComponent extends StatefulWidget {
  @override
  ClinicVisitComponentState createState() => ClinicVisitComponentState();
}

class ClinicVisitComponentState extends State<ClinicVisitComponent> {
  static String tag = '/ClinicVisitComponent';
  List<DepartmentData> departmentList = serviceListDataList();
  int? selectedIndex = 0;

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
    return SingleChildScrollView(
      child: Column(
        children: [
          16.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Clinic Visit', style: boldTextStyle(size: 24)),
                  8.height,
                  Text('Find the service you are', style: secondaryTextStyle()),
                  16.height,
                ],
              ).expand(),
              roundedIconContainer(Icons.search, colorBlue),
              16.width,
              roundedIconContainer(
                  Icons.calendar_view_day_outlined, colorBlue),
            ],
          ).paddingOnly(right: 16.0, left: 16.0),
          8.height,
          ListView.builder(
            padding: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 70),
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: departmentList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 16),
                padding: EdgeInsets.all(8.0),
                decoration: boxDecorationWithRoundedCorners(
                  border: Border.all(
                      color: selectedIndex == index
                          ? colorBlue
                          : colorLightGrey100),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset((departmentList[index].image)!.validate(),
                                height: 75, width: 75, fit: BoxFit.fill)
                            .paddingAll(8.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text((departmentList[index].title)!.validate(),
                                style: boldTextStyle(size: 18)),
                            8.height,
                            Text((departmentList[index].subtitle).validate(),
                                style: secondaryTextStyle()),
                            8.height,
                            Text((departmentList[index].price).validate(),
                                style: boldTextStyle(color: colorDarkBlue)),
                          ],
                        ),
                      ],
                    ),
                    8.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Icon(Icons.watch_later_outlined,
                                      size: 14)),
                              TextSpan(
                                  text: ' next available time',
                                  style: secondaryTextStyle()),
                            ],
                          ),
                        ),
                        Text('Dec 23 at 8:30 AM',
                            style: secondaryTextStyle(color: Colors.black87)),
                      ],
                    ).paddingOnly(left: 8, right: 8),
                    8.height,
                  ],
                ),
              ).onTap(
                () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
