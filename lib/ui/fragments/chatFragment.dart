import 'package:flutter/material.dart';
import 'package:medicare/ui/components/botSupportComponent.dart';
import 'package:medicare/ui/components/doctorChatComponent.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/String.dart';
import 'package:nb_utils/nb_utils.dart';

class ChatFragment extends StatefulWidget {
  static String tag = '/ChatFragment';

  @override
  ChatFragmentState createState() => ChatFragmentState();
}

class ChatFragmentState extends State<ChatFragment>
    with SingleTickerProviderStateMixin {
  int notificationCounter = 3;
  TextEditingController _searchController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
    _tabController = TabController(length: 2, vsync: this);
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
     //
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Container(
          width: context.width(),
          decoration: boxDecorationWithRoundedCorners(
              borderRadius: radiusOnly(topRight: 32)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              24.height,
              Text('Inbox', style: boldTextStyle(size: 20)).paddingLeft(16.0),
              8.height,
              AppTextField(
                controller: _searchController,
                textFieldType: TextFieldType.OTHER,
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: _searchController.text.isEmpty
                      ? null
                      : Icon(Icons.clear).onTap(() {
                          _searchController.clear();
                        }),
                ),
              ).paddingOnly(right: 16.0, left: 16.0),
              16.height,
              TabBar(
                controller: _tabController,
                labelColor: colorBlue,
                indicatorColor: colorBlue,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                      text: doctors! +
                          ' (' +
                          notificationCounter.toString() +
                          ')'),
                  Tab(text: bot_support),
                ],
              ),
              TabBarView(
                controller: _tabController,
                children: [
                  DoctorChatComponent(),
                  BotSupportComponent(),
                ],
              ).expand(),
            ],
          ),
        ),
      ),
    );
  }
}
