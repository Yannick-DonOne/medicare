import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicare/utils/Image.dart';
import 'package:medicare/utils/String.dart';
import 'package:nb_utils/nb_utils.dart';

class PillDetailComponent extends StatefulWidget {
  static String tag = '/PillDetailComponent';

  @override
  PillDetailComponentState createState() => PillDetailComponentState();
}

class PillDetailComponentState extends State<PillDetailComponent> {
  List<String?> detail = <String?>[
    pill_description,
    pill_description,
    pill_description
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
        children: <Widget>[
          Text('Detail', style: boldTextStyle(size: 24)),
          8.height,
          Image.asset(
            pharmacySlide2!,
            height: 150,
            width: context.width(),
            fit: BoxFit.cover,
          ).cornerRadiusWithClipRRect(8.0),
          16.height,
          Text('Description', style: boldTextStyle()),
          Column(
            children: <Widget>[
              for (int i = 0; i < detail.length; i++)
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.brightness_1_rounded, size: 8).paddingTop(4.0),
                    8.width,
                    Text(detail[i].validate(),
                            style: secondaryTextStyle(size: 16))
                        .expand(),
                  ],
                ).paddingAll(8.0),
            ],
          ),
        ],
      ).paddingAll(16.0),
    );
  }
}
