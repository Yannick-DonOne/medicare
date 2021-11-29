import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medicare/ui/model/rrderSuccessData.dart';
import 'package:medicare/ui/screens/rrderDetailScreen.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/DataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class OrderSuccessComponent extends StatefulWidget {
  static String tag = '/OrderSuccessComponent';

  @override
  OrderSuccessComponentState createState() => OrderSuccessComponentState();
}

class OrderSuccessComponentState extends State<OrderSuccessComponent> {
  List<OrderSuccessData> data = mlOrderSuccessDataList();

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
    return Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment.center,
      decoration: boxDecorationWithRoundedCorners(
          borderRadius: radiusOnly(topRight: 32)),
      child: Column(
        children: [
          16.height,
          Text('Please Prepare the amount to be paid',
              style: secondaryTextStyle(size: 16)),
          8.height,
          Text('\$250.00', style: boldTextStyle(size: 18)),
          16.height,
          Container(
            alignment: Alignment.center,
            height: 50,
            width: context.width(),
            decoration: boxDecorationWithRoundedCorners(
                borderRadius: radius(12),
                border: Border.all(color: colorBlue)),
            child: Text("Track Order  >",
                style: boldTextStyle(color: colorDarkBlue)),
          ).onTap(() {
            OrderDetailScreen().launch(context);
          }),
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Delivery by', style: secondaryTextStyle()),
              4.width,
              Text('Medilab',
                  style: secondaryTextStyle(color: colorDarkBlue)),
            ],
          ),
          16.height,
          Divider(height: 0.5),
          16.height,
          Column(
            children: data.map((e) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.rounded_corner, size: 16, color: black),
                  4.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.title.validate(), style: primaryTextStyle()),
                      4.height,
                      Text(e.data.validate(),
                          style: boldTextStyle(color: colorBlue, size: 18)),
                    ],
                  )
                ],
              ).paddingBottom(16.0);
            }).toList(),
          ),
          42.height,
        ],
      ),
    );
  }
}
