import 'package:flutter/material.dart';
import 'package:medicare/ui/screens/botScreen.dart';
import 'package:nb_utils/nb_utils.dart';

import 'chatListComponent.dart';

class BotSupportComponent extends StatefulWidget {
  static String tag = '/BotSupportComponent';

  @override
  BotSupportComponentState createState() => BotSupportComponentState();
}

class BotSupportComponentState extends State<BotSupportComponent> {
  List<String> botsData = <String>['Tony Bot', 'Dr. Heldi Kulm'];

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
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Available Bots', style: boldTextStyle()),
          16.height,
          ChatListComponent(botsData, Colors.yellow, BotScreen()),
        ],
      ),
    );
  }
}
