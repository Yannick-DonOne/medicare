import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:medicare/ui/model/departmentData.dart';
import 'package:medicare/ui/model/topHospitalData.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/DataProvider.dart';
import 'package:medicare/utils/String.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeBottomComponent extends StatefulWidget {
  static String tag = '/HomeBottomComponent';

  @override
  HomeBottomComponentState createState() => HomeBottomComponentState();
}

class HomeBottomComponentState extends State<HomeBottomComponent> {
  List<DepartmentData> departmentList = departmentDataList();

  List<TopHospitalData> tophospitalList = topHospitalDataList();

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
      children: [
        8.height,
        Row(
          children: [
            Text(department!, style: boldTextStyle(size: 18)).expand(),
            Text(view_all!, style: secondaryTextStyle(color: colorBlue)),
            4.width,
            Icon(Icons.keyboard_arrow_right, color: colorBlue, size: 16),
          ],
        ).paddingOnly(left: 16, right: 16),
        10.height,
        StaggeredGridView.countBuilder(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          // TODO: show a max 6 then open new screen with all.
          itemCount: departmentList.length, 
          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          itemBuilder: (context, index) {
            return Container(
              decoration: boxDecorationWithRoundedCorners(
                borderRadius: radius(12),
                border: Border.all(color: colorLightGrey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Image.asset((departmentList[index].image).validate(),
                              height: 120,
                              width: context.width(),
                              fit: BoxFit.cover)
                          .cornerRadiusWithClipRRectOnly(
                              topRight: 8, topLeft: 8),
                    ],
                  ),
                  16.height,
                  Text((departmentList[index].title).validate(),
                          style: boldTextStyle())
                      .paddingOnly(left: 10, right: 10),
                  2.height,
                  Text((departmentList[index].subtitle).validate(),
                          style: secondaryTextStyle())
                      .paddingOnly(left: 10, right: 10),
                  4.height,
                ],
              ),
            ).onTap(() {
              // TODO: Show doctors for this department.
              // ProductDetailScreen().launch(context);
            });
          },
        ),
      ],
    );
  }
}
