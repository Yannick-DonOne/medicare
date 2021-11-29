import 'package:flutter/material.dart';
import 'package:medicare/ui/components/createMedicineComponent.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:medicare/utils/Image.dart';
import 'package:nb_utils/nb_utils.dart';

class CreateNewMedicine extends StatefulWidget {
  static String tag = '/CreateNewMedicine';

  @override
  CreateNewMedicineState createState() => CreateNewMedicineState();
}

class CreateNewMedicineState extends State<CreateNewMedicine> {
  List<String?> medicineImage = <String?>[
    mediFive,
    mediTwo,
    mediThree,
    mediFour
  ];
  List<String?> time = <String?>['08:30 am', '15:30 am', '20:30 am', ''];
  List<String?> day = <String?>[
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

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
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              decoration: boxDecorationWithRoundedCorners(
                  borderRadius: radiusOnly(topRight: 32)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      backToPreviousIcon(context, black),
                      8.width,
                      Text('Create New Medicine',
                              style: boldTextStyle(size: 20))
                          .expand(),
                    ],
                  ).paddingAll(16.0),
                  8.height,
                  CreateMedicineComponent().flexible(),
                ],
              ),
            ),
            AppButton(
              width: context.width(),
              color: primaryColor,
              child: Text('Save',
                  textAlign: TextAlign.center,
                  style: boldTextStyle(color: whiteColor)),
              onTap: () {
                finish(context);
              },
            ).paddingOnly(right: 16, left: 16, bottom: 16),
          ],
        ),
      ),
    );
  }
}
