import 'package:flutter/material.dart';
import 'package:medicare/ui/components/pIllHowToUseComponent.dart';
import 'package:medicare/ui/components/pillDetailComponent.dart';
import 'package:medicare/ui/components/pillReviewComponent.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:nb_utils/nb_utils.dart';

class ProductMoreDetailScreen extends StatefulWidget {
  static String tag = '/ProductMoreDetailScreen';

  @override
  ProductMoreDetailScreenState createState() =>
      ProductMoreDetailScreenState();
}

class ProductMoreDetailScreenState extends State<ProductMoreDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Container(
          decoration: boxDecorationWithRoundedCorners(
              borderRadius: radiusOnly(topRight: 32)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              24.height,
              Icon(Icons.close, color: colorBlue)
                  .paddingRight(32.0)
                  .onTap(() {
                finish(context);
              }),
              24.height,
              Container(
                decoration: boxDecorationWithRoundedCorners(
                    borderRadius: radiusOnly(topRight: 32)),
                height: context.height(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TabBar(
                      controller: _tabController,
                      labelColor: colorBlue,
                      indicatorColor: colorBlue,
                      unselectedLabelColor: Colors.grey,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelStyle: primaryTextStyle(),
                      tabs: [
                        Tab(text: 'Detail'),
                        Tab(text: 'How to Use'),
                        Tab(text: 'Review'),
                      ],
                    ),
                    TabBarView(
                      controller: _tabController,
                      children: [
                        PillDetailComponent(),
                        PillHowToUseComponent(),
                        PillReviewComponent(),
                      ],
                    ).expand(),
                  ],
                ),
              ).expand(),
            ],
          ),
        ),
      ),
    );
  }
}
