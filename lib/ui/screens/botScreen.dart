import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medicare/ui/model/inboxData.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:medicare/utils/DataProvider.dart';
import 'package:medicare/utils/Image.dart';
import 'package:nb_utils/nb_utils.dart';

class BotScreen extends StatefulWidget {
  static String tag = '/BotScreen';

  @override
  BotScreenState createState() => BotScreenState();
}

class BotScreenState extends State<BotScreen> {
  TextEditingController messageController = TextEditingController();
  List<InboxData> data = mlBotChatDataList();

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Stack(
          children: [
            Positioned(
              top: 8.0,
              child: Row(
                children: [
                  8.width,
                  backToPreviousWidget(context, white),
                  8.width,
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.yellow,
                        radius: 28.0,
                        child:
                            Image.asset(doctor_image!, fit: BoxFit.cover)
                                .cornerRadiusWithClipRRect(30.0),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 6,
                        child: Icon(Icons.brightness_1_rounded,
                            color: Colors.greenAccent, size: 14),
                      )
                    ],
                  ),
                  8.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tony Bot (General Care)',
                          style: boldTextStyle(color: whiteColor, size: 18)),
                      4.height,
                      Text('Online',
                          style: secondaryTextStyle(
                              size: 16, color: white.withOpacity(0.5))),
                    ],
                  )
                ],
              ).paddingAll(16.0),
            ),
            Container(
              width: context.width(),
              height: context.height(),
              margin: EdgeInsets.only(top: 90),
              decoration: boxDecorationWithRoundedCorners(
                  borderRadius: radiusOnly(topRight: 32)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    8.height,
                    Text('9:41 AM', style: secondaryTextStyle(size: 16)),
                    8.height,
                    ListView.builder(
                      padding: EdgeInsets.all(16.0),
                      scrollDirection: Axis.vertical,
                      reverse: true,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        if (data[index].id == 0) {
                          return Column(
                            children: [
                              8.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: boxDecorationWithRoundedCorners(
                                        backgroundColor: Colors.blue.shade500,
                                        borderRadius: radius(12.0)),
                                    padding: EdgeInsets.all(12.0),
                                    child: Text(
                                        (data[index].message).validate(),
                                        style: primaryTextStyle(color: white)),
                                  ),
                                  8.width,
                                  CircleAvatar(
                                    backgroundColor: colorCyan,
                                    child: Image.asset(profile_picture!,
                                            fit: BoxFit.fill)
                                        .cornerRadiusWithClipRRect(30.0),
                                  ),
                                ],
                              ),
                            ],
                          );
                        } else {
                          return Column(
                            children: [
                              8.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.yellow,
                                    child: Image.asset(doctor_image!,
                                            fit: BoxFit.fill)
                                        .cornerRadiusWithClipRRect(30.0),
                                  ),
                                  8.width,
                                  Container(
                                    decoration: boxDecorationWithRoundedCorners(
                                        borderRadius: radius(12.0),
                                        backgroundColor: colorLightGrey100),
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(
                                        (data[index].message).validate(),
                                        style: primaryTextStyle(color: black)),
                                  ).paddingOnly(right: 42.0).expand(),
                                ],
                              ),
                            ],
                          ).paddingOnly(right: 32.0);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ).paddingTop(8.0),
          ],
        ),
        bottomNavigationBar: Container(
          padding: MediaQuery.of(context).viewInsets,
          decoration: boxDecorationWithRoundedCorners(
            backgroundColor: white,
            borderRadius: radius(0.0),
            border: Border.all(color: colorLightGrey100),
          ),
          child: Row(
            children: [
              8.width,
              Icon(CupertinoIcons.smiley,
                  size: 22, color: Colors.grey.shade600),
              4.width,
              Icon(Icons.image_outlined, size: 22, color: Colors.grey.shade600),
              4.width,
              Icon(Icons.mic_none, size: 22, color: Colors.grey.shade600),
              8.width,
              AppTextField(
                controller: messageController,
                textFieldType: TextFieldType.OTHER,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write a reply...',
                  hintStyle: secondaryTextStyle(size: 16),
                ),
              ).expand(),
              Icon(Icons.send_outlined, size: 24, color: Colors.blue)
                  .paddingAll(4.0)
                  .onTap(() {
                addMessage();
                messageController.clear();
              }),
              8.width,
            ],
          ),
        ),
      ),
    );
  }

  void addMessage() {
    setState(() {
      data.insert(0, InboxData(id: 0, message: messageController.text));
    });
  }
}
