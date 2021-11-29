import 'package:flutter/material.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'symptomsDescription.dart';

class DiseaseSymptomsComponent extends StatefulWidget {
  static String tag = '/DiseaseSymptomsComponent';

  @override
  DiseaseSymptomsComponentState createState() =>
      DiseaseSymptomsComponentState();
}

class DiseaseSymptomsComponentState extends State<DiseaseSymptomsComponent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    print('tabb');
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
    return Container(
      color: white,
      height: context.height(),
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            labelStyle: boldTextStyle(color: Colors.grey.shade400),
            controller: _tabController,
            labelColor: colorBlue,
            indicatorColor: colorBlue,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Total'),
              Tab(text: 'Casual'),
              Tab(text: 'Prevent'),
              Tab(text: 'Treatment'),
            ],
          ),
          Divider(),
          TabBarView(
            controller: _tabController,
            children: [
              SymptomsDiscriptionComponent(),
              SymptomsDiscriptionComponent(),
              SymptomsDiscriptionComponent(),
              SymptomsDiscriptionComponent(),
            ],
          ).flexible(),
        ],
      ),
    );
  }
}
