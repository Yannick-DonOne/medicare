import 'package:flutter/material.dart';
import 'package:medicare/ui/model/topHospitalData.dart';
import 'package:medicare/ui/screens/hospitalDetailScreen.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:medicare/utils/DataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class HospitalListComponent extends StatefulWidget {
  static String tag = '/HospitalListComponent';

  @override
  HospitalListComponentState createState() => HospitalListComponentState();
}

class HospitalListComponentState extends State<HospitalListComponent> {
  double progressValue = 2.5;
  int? selectedIndex = 0;
  bool? liked = false;

  List<TopHospitalData> tophospitalList = hospitalListDataList();

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
                  Text('Hospital Visit', style: boldTextStyle(size: 24)),
                  8.height,
                  Text('Find the hospital you want',
                      style: secondaryTextStyle()),
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
            padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 70),
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: tophospitalList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(12.0),
                decoration: boxDecorationWithRoundedCorners(
                  border: Border.all(
                      color: selectedIndex == index
                          ? colorBlue
                          : colorLightGrey100),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: <Widget>[
                        Image.asset(
                          (tophospitalList[index].image).validate(),
                          width: double.infinity,
                          height: 150.0,
                          fit: BoxFit.fill,
                        ).cornerRadiusWithClipRRect(8.0),
                        Positioned(
                          top: 16.0,
                          right: 16.0,
                          child: Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: boxDecorationWithRoundedCorners(
                              backgroundColor: white,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: radius(24),
                            ),
                            child: liked == true && selectedIndex == index
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        liked = false;
                                      });
                                    },
                                    child: Icon(Icons.favorite,
                                        color: Colors.red, size: 16),
                                  )
                                : InkWell(
                                    onTap: () {
                                      setState(() {
                                        liked = true;
                                      });
                                    },
                                    child: Icon(Icons.favorite_outline,
                                        color: Colors.grey, size: 16),
                                  ),
                          ),
                        ),
                        Positioned(
                          bottom: 16.0,
                          right: 16.0,
                          child: Container(
                            padding: EdgeInsets.all(2.0),
                            decoration: boxDecorationWithRoundedCorners(
                              backgroundColor: colorDarkBlue,
                              borderRadius: radius(12),
                            ),
                            child: Text(
                                    (tophospitalList[index].fees).validate(),
                                    style: secondaryTextStyle(color: white))
                                .paddingOnly(right: 8.0, left: 8.0),
                          ),
                        )
                      ],
                    ),
                    16.height,
                    Text((tophospitalList[index].title).validate(),
                        style: boldTextStyle()),
                    8.height,
                    Text((tophospitalList[index].city).validate(),
                        style: secondaryTextStyle()),
                    8.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(Icons.star, color: Colors.yellow)
                                    .paddingRight(4),
                              ),
                              TextSpan(
                                  text: tophospitalList[index].rating,
                                  style: primaryTextStyle(
                                      color: Colors.grey.shade500)),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Detail',
                                  style: primaryTextStyle(
                                      color: Colors.grey.shade500)),
                              WidgetSpan(
                                child: Icon(Icons.arrow_forward,
                                        color: colorDarkBlue, size: 16)
                                    .paddingLeft(4),
                              ),
                            ],
                          ),
                        ).onTap(() {
                          HospitalDetailScreen().launch(context);
                        }),
                      ],
                    ),
                  ],
                ),
              ).paddingBottom(16.0).onTap(() {
                setState(() {
                  selectedIndex = index;
                });
              });
            },
          ),
        ],
      ),
    );
  }
}
