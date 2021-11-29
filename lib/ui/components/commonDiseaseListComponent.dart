import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:medicare/ui/model/diseaseData.dart';
import 'package:medicare/ui/screens/diseaseSymptomsScreen.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/DataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class CommonDiseaseListComponent extends StatefulWidget {
  static String tag = '/CommonDiseaseListComponent';

  @override
  CommonDiseaseListComponentState createState() =>
      CommonDiseaseListComponentState();
}

class CommonDiseaseListComponentState
    extends State<CommonDiseaseListComponent> {
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
    return StaggeredGridView.countBuilder(
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: radius(12),
            border: Border.all(color: colorLightGrey),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(data[index].image.validate(),
                      fit: BoxFit.cover, height: 100)
                  .cornerRadiusWithClipRRect(12.0),
              8.height,
              Text(data[index].title.validate(), style: boldTextStyle()),
              4.height,
              Text(data[index].subtitle.validate(),
                  style: secondaryTextStyle(size: 16)),
            ],
          ),
        ).onTap(() {
          DieaseseSymptomsScreen().launch(context);
        });
      },
      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
    );
  }
}
