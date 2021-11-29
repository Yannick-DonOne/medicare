import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medicare/ui/screens/chatScreen.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'chatListComponent.dart';

class DoctorChatComponent extends StatefulWidget {
  static String tag = '/DoctorChatComponent';

  @override
  DoctorChatComponentState createState() => DoctorChatComponentState();
}

class DoctorChatComponentState extends State<DoctorChatComponent> {
  int notificationCounter = 3;
  List<String> unreadData = <String>['Dr. Miranda Kerr', 'Dr. Heldi Kulm '];
  List<String> otherData = <String>[
    'Dr.Stephen',
    'Dr. Miranda Kerr',
    'Dr. Miranda Kerr'
  ];

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Unread', style: boldTextStyle()),
          16.height,
          ChatListComponent(unreadData, colorGreyShade, ChatScreen()),
          Divider(height: 32),
          Text('Other', style: boldTextStyle()),
          16.height,
          ChatListComponent(otherData, colorGreyShade, ChatScreen()),
        ],
      ).paddingAll(16.0),
    );
  }
}
