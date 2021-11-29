import 'package:flutter/material.dart';
import 'package:medicare/ui/model/covidData.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/DataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class CovidTopRegionComponent extends StatefulWidget {
  static String tag = '/CovidTopRegionComponent';

  @override
  CovidTopRegionComponentState createState() =>
      CovidTopRegionComponentState();
}

class CovidTopRegionComponentState extends State<CovidTopRegionComponent> {
  List<CovidData> data = covidCasesDataList();

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Top Regions', style: boldTextStyle(size: 24)),
        16.height,
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: boxDecorationWithRoundedCorners(
              backgroundColor: colorGreyShade, borderRadius: radius(8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Confirm Cases', style: boldTextStyle(size: 20)),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Region',
                      style: boldTextStyle(size: 12, color: blackColor)),
                  16.width,
                  Text('Actives',
                      style: boldTextStyle(size: 12, color: blackColor)),
                  Text('Cases',
                      style: boldTextStyle(size: 12, color: blackColor)),
                ],
              ),
              Divider(),
              Column(
                children: data.map((e) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(e.country.validate(),
                              style:
                                  boldTextStyle(size: 12, color: blackColor)),
                          16.width,
                          Text(e.active.validate(),
                              style:
                                  boldTextStyle(size: 12, color: Colors.green)),
                          Text(e.death.validate(),
                              style:
                                  boldTextStyle(size: 12, color: colorRed)),
                        ],
                      ),
                      Divider(),
                    ],
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
