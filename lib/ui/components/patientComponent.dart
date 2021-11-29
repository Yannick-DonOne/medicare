import 'package:flutter/material.dart';
import 'package:medicare/ui/model/patientData.dart';
import 'package:medicare/ui/screens/addDependentScreen.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/DataProvider.dart';
import 'package:medicare/utils/Image.dart';
import 'package:nb_utils/nb_utils.dart';

class PatientComponent extends StatefulWidget {
  static String tag = '/PatientComponent';

  @override
  PatientComponentState createState() => PatientComponentState();
}

class PatientComponentState extends State<PatientComponent> {
  List<PatientData> patientData = patientDataList();
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Choose Patient', style: boldTextStyle(size: 24)),
          8.height,
          Text('Find the service you are', style: secondaryTextStyle()),
          16.height,
          ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: patientData.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: boxDecorationWithRoundedCorners(
                  borderRadius: radius(12),
                  border: Border.all(
                      color: selectedIndex == index
                          ? colorBlue
                          : colorLightGrey100),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      child:
                          Image.asset(profile_picture!).paddingAll(4.0),
                      radius: 32.0,
                      backgroundColor: colorCyan,
                    ),
                    8.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text((patientData[index].name).validate(),
                            style: boldTextStyle()),
                        4.height,
                        Text((patientData[index].dob).validate(),
                            style: secondaryTextStyle(size: 16)),
                        4.height,
                        Container(
                          padding: EdgeInsets.fromLTRB(16, 2, 16, 2),
                          decoration: boxDecorationWithRoundedCorners(
                            backgroundColor: Colors.blue.shade500,
                            borderRadius: radius(20),
                          ),
                          child: Text((patientData[index].relation).validate(),
                              style: boldTextStyle(
                                  size: 14, color: whiteColor, wordSpacing: 4),
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ],
                ).paddingAll(16.0),
              ).paddingBottom(16.0).onTap(() {
                setState(() {
                  selectedIndex = index;
                  print('$index');
                });
              });
            },
          ),
          Container(
            alignment: Alignment.center,
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: radius(12),
              border: Border.all(color: Colors.blue),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Add New Dependent',
                    style: primaryTextStyle(color: colorDarkBlue)),
                8.width,
                Icon(Icons.add_circle_outline,
                    color: colorDarkBlue, size: 16),
              ],
            ).paddingAll(16.0).onTap(() {
              AddDependentScreen().launch(context);
            }),
          ),
        ],
      ).paddingAll(16.0),
    );
  }
}
