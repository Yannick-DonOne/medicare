import 'package:flutter/material.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Image.dart';
import 'package:medicare/utils/String.dart';
import 'package:nb_utils/nb_utils.dart';

class PillReviewComponent extends StatefulWidget {
  static String tag = '/PillReviewComponent';

  @override
  PillReviewComponentState createState() => PillReviewComponentState();
}

class PillReviewComponentState extends State<PillReviewComponent> {
  List<String?> person = <String?>[
    'Mr. Tony Le',
    'Ms. Gal Galot',
    'Mr. Gauhy',
    'Mr. Tony Le',
    'Ms. Gal Galot',
    'Mr. Gauhy'
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
          Text('Reviews (234)', style: boldTextStyle(size: 24)),
          16.height,
          Column(
            children: <Widget>[
              for (int i = 0; i < person.length; i++)
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  decoration: boxDecorationWithRoundedCorners(
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                    borderRadius: radius(12),
                  ),
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: colorCyan,
                            child: Image.asset(profile_picture!,
                                    fit: BoxFit.fill)
                                .paddingAll(2.0),
                          ),
                          8.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(person[i].validate(),
                                  style: boldTextStyle(size: 14)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.yellow, size: 14),
                                      Text("4.8",
                                          style: secondaryTextStyle(
                                              color: Colors.grey.shade500)),
                                    ],
                                  ),
                                  Text("23 Oct,2021",
                                      style: secondaryTextStyle(
                                          size: 16, color: colorLightGrey)),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      8.height,
                      Text(pill_desc!,
                          style: secondaryTextStyle(color: Colors.grey),
                          textAlign: TextAlign.justify),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ).paddingAll(16.0),
    );
  }
}
