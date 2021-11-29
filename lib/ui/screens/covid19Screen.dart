import 'package:flutter/material.dart';
import 'package:medicare/ui/components/casesComponent.dart';
import 'package:medicare/ui/components/newsAndVideoComponent.dart';
import 'package:medicare/ui/components/vacciensComponent.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:medicare/utils/Image.dart';
import 'package:medicare/utils/String.dart';
import 'package:nb_utils/nb_utils.dart';

class CovidScreen extends StatefulWidget {
  static String tag = '/CovidScreen';

  @override
  CovidScreenState createState() => CovidScreenState();
}

class CovidScreenState extends State<CovidScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          children: [
            Row(
              children: [
                backToPreviousIcon(context, white),
                8.width,
                Text('Covid-19',
                        style: boldTextStyle(color: whiteColor, size: 20))
                    .expand(),
                Row(
                  children: [
                    Image.asset(icon_help!, width: 16, height: 16),
                    Text('Help',
                        style: secondaryTextStyle(color: white, size: 16)),
                  ],
                ),
              ],
            ).paddingAll(16.0),
            Container(
              width: context.width(),
              decoration: boxDecorationWithRoundedCorners(
                  borderRadius: radiusOnly(topRight: 32)),
              child: Column(
                children: [
                  16.height,
                  Row(
                    children: [
                      4.width,
                      Text(global_status!, style: boldTextStyle()).expand(),
                      Text('152.799.358', style: boldTextStyle()),
                      16.width,
                    ],
                  ).paddingOnly(right: 16, left: 16),
                  Divider(thickness: 1.0).paddingOnly(right: 16, left: 16),
                  TabBar(
                    controller: _tabController,
                    labelColor: colorBlue,
                    indicatorColor: colorBlue,
                    unselectedLabelColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelStyle: primaryTextStyle(size: 14),
                    tabs: [
                      Tab(text: 'Cases'),
                      Tab(text: 'Vaccines'),
                      Tab(text: 'News & Videos'),
                    ],
                  ),
                  Flexible(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        CasesComponent(),
                        VaccineComponent(),
                        NewsAnVideoComponent(),
                      ],
                    ),
                  ),
                ],
              ),
            ).flexible()
          ],
        ),
      ),
    );
  }
}
