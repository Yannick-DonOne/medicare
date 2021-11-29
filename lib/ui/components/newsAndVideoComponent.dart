import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medicare/ui/model/newsData.dart';
import 'package:medicare/utils/DataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class NewsAnVideoComponent extends StatefulWidget {
  static String tag = '/NewsAnVideoComponent';

  @override
  NewsAnVideoComponentState createState() => NewsAnVideoComponentState();
}

class NewsAnVideoComponentState extends State<NewsAnVideoComponent> {
  List<NewsData> data = covidNewsDataList();

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
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset((data[0].image).validate(),
                  height: 200, width: context.width(), fit: BoxFit.cover)
              .cornerRadiusWithClipRRect(12.0),
          16.height,
          Text((data[0].title).validate(), style: boldTextStyle()),
          4.height,
          Text(data[0].duration.validate(),
              style: secondaryTextStyle(size: 16, color: Colors.grey[400])),
          32.height,
          Text('List news', style: boldTextStyle()),
          16.height,
          Column(
            children: data.map((e) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset((e.image).validate(),
                          width: 80, height: 80, fit: BoxFit.cover)
                      .cornerRadiusWithClipRRect(12.0),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text((e.title).validate(), style: boldTextStyle()),
                      8.height,
                      Text((e.duration).validate(),
                          style: secondaryTextStyle(
                              size: 16, color: Colors.grey[400]),
                          textAlign: TextAlign.center),
                    ],
                  ).expand()
                ],
              ).paddingBottom(16.0);
            }).toList(),
          ),
        ],
      ).paddingAll(16.0),
    );
  }
}
