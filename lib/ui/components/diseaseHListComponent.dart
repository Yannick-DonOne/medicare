import 'package:flutter/material.dart';
import 'package:medicare/ui/model/diseaseData.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/DataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class DiseaseHorizontalList extends StatefulWidget {
  static String tag = '/DiseaseHorizontalList';

  @override
  DiseaseHorizontalListState createState() => DiseaseHorizontalListState();
}

class DiseaseHorizontalListState extends State<DiseaseHorizontalList> {
  List<DiseaseData> listDisease = diseaseDataList();

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
    return HorizontalList(
        wrapAlignment: WrapAlignment.spaceEvenly,
        itemCount: listDisease.length,
        padding: EdgeInsets.only(right: 16, left: 8),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 150,
            padding: EdgeInsets.all(16),
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: radius(12),
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(listDisease[index].image.validate(),
                        fit: BoxFit.cover, height: 100)
                    .cornerRadiusWithClipRRect(12.0),
                8.height,
                Text(listDisease[index].title.validate(),
                    style: boldTextStyle(size: 14, color: colorDarkBlue)),
                4.height,
                Text(listDisease[index].subtitle.validate(),
                    style: secondaryTextStyle(size: 16)),
                4.height,
              ],
            ),
          ).paddingOnly(left: 8);
        });
  }
}
