import 'package:flutter/material.dart';
import 'package:medicare/ui/screens/commonDiseaseScreen.dart';
import 'package:medicare/ui/screens/specialistScreen.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/String.dart';
import 'package:nb_utils/nb_utils.dart';

import 'diseaseHListComponent.dart';
import 'specialistHListComponet.dart';

class DieaseaseComponent extends StatefulWidget {
  static String tag = '/DieaseaseComponent';

  @override
  DieaseaseComponentState createState() => DieaseaseComponentState();
}

class DieaseaseComponentState extends State<DieaseaseComponent> {
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
    return Container(
      decoration: boxDecorationWithRoundedCorners(
          borderRadius: radiusOnly(topRight: 32)),
      child: Column(
        children: [
          16.height,
          Row(
            children: [
              Text('Specialist', style: boldTextStyle(size: 18)).expand(),
              Text(view_all!,
                  style: secondaryTextStyle(color: colorBlue, size: 16)),
              4.width,
              Icon(Icons.arrow_forward_ios, color: colorBlue, size: 12),
            ],
          ).paddingAll(16.0).onTap(() {
            SpecialistScreen().launch(context);
          }),
          SpecialistHorizontalList(),
          16.height,
          SpecialistHorizontalList(),
          Row(
            children: [
              Text('Common Disease', style: boldTextStyle(size: 18)).expand(),
              Text(view_all!,
                  style: secondaryTextStyle(color: colorBlue, size: 16)),
              4.width,
              Icon(Icons.arrow_forward_ios, color: colorBlue, size: 12),
            ],
          ).paddingAll(16.0).onTap(() {
            CommonDiseaseScreen().launch(context);
          }),
          DiseaseHorizontalList(),
          40.height,
        ],
      ),
    );
  }
}
