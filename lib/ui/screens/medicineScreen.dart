import 'package:flutter/material.dart';
import 'package:medicare/ui/components/allMedicineComponent.dart';
import 'package:medicare/ui/components/medicineInformationScreen.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'createNewMedicineScreen.dart';

class MedicineScreen extends StatefulWidget {
  static String tag = '/MedicineScreen';
  final int? index;

  MedicineScreen({this.index});

  @override
  MedicineScreenState createState() => MedicineScreenState();
}

class MedicineScreenState extends State<MedicineScreen> {
  List<String> title = ['List Medicine', 'Information'];
  List<Widget> data = [
    AllMedicineComponent(),
    MedicineInformationComponent()
  ];
  List<String> button = ['Add new medicine +', 'Change Schedule'];

  @override
  void initState() {
    super.initState();
    print(widget.index);
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
              padding: EdgeInsets.all(16.0),
              decoration: boxDecorationWithRoundedCorners(
                  borderRadius: radiusOnly(topRight: 32)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(title[widget.index!], style: boldTextStyle(size: 24))
                          .expand(),
                      Icon(Icons.close, color: colorBlue).onTap(() {
                        finish(context);
                      }),
                      8.width,
                    ],
                  ),
                  24.height,
                  data[widget.index!].validate().flexible(),
                ],
              ),
            ),
            AppButton(
              width: context.width(),
              color: primaryColor,
              child: Text(
                button[widget.index!].validate(),
                style: primaryTextStyle(color: whiteColor),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                CreateNewMedicine().launch(context);
              },
            ).paddingOnly(right: 16, left: 16, bottom: 16),
          ],
        ),
      ),
    );
  }
}
