import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medicare/ui/components/commonDiseaseListComponent.dart';
import 'package:medicare/ui/model/diseaseData.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:medicare/utils/DataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class CommonDiseaseScreen extends StatefulWidget {
  static String tag = '/CommonDiseaseScreen';

  @override
  CommonDiseaseScreenState createState() => CommonDiseaseScreenState();
}

class CommonDiseaseScreenState extends State<CommonDiseaseScreen> {
  int i = 0;
  List<DiseaseData> data = diseaseDataList();

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
          padding: EdgeInsets.all(16.0),
          decoration: boxDecorationWithRoundedCorners(
              borderRadius: radiusOnly(topRight: 32)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              8.height,
              Row(
                children: [
                  8.width,
                  backToPreviousWidget(context, black),
                  8.width,
                  Text('Common Disesase', style: boldTextStyle(size: 24))
                      .expand(),
                ],
              ),
              16.height,
              CommonDiseaseListComponent().expand()
            ],
          ),
        ),
      ),
    );
  }
}
