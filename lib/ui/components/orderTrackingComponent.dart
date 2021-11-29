import 'package:flutter/material.dart';
import 'package:medicare/ui/model/deliveredData.dart';
import 'package:medicare/ui/model/orderTrackData.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/DataProvider.dart';
import 'package:medicare/utils/Image.dart';
import 'package:nb_utils/nb_utils.dart';

class OrderTrackingDetailComponent extends StatefulWidget {
  static String tag = '/OrderTrackingDetailComponent';

  @override
  OrderTrackingDetailComponentState createState() =>
      OrderTrackingDetailComponentState();
}

class OrderTrackingDetailComponentState
    extends State<OrderTrackingDetailComponent> {
  List<OrderTrackData> data = orderTrackDataList();
  List<DeliveredData> descriptionData = deliveredStatusDataList();

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
    return ListView(
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(16.0),
      shrinkWrap: true,
      children: [
        Column(
          children: data.map((e) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    8.height,
                    Text((e.date).validate(),
                        style: secondaryTextStyle(color: black)),
                    Text((e.time).validate(), style: primaryTextStyle()),
                  ],
                ),
                16.width,
                Column(
                  children: [
                    Container(
                      height: 40.0,
                      width: 40.0,
                      child: (e.value == true)
                          ? Icon(
                              Icons.check_box,
                              color: colorBlue,
                            )
                          : Icon(
                              Icons.check_box_outline_blank,
                              color: Colors.grey,
                            ),
                    ),
                    (e.value == true)
                        ? Container(
                            height: 100,
                            width: 1.0,
                            color: Colors.grey.withOpacity(0.3),
                          )
                        : Container(),
                  ],
                ),
                16.width,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    8.height,
                    Text((e.stage).validate(), style: boldTextStyle(size: 20)),
                    8.width,
                    Text(
                      (e.message).validate(),
                      style: secondaryTextStyle(
                          size: 16, color: Colors.grey.shade500),
                    ),
                  ],
                ).expand(),
              ],
            );
          }).toList(),
        ),
        16.height,
        Divider(thickness: 0.5),
        16.height,
        Text('Description', style: boldTextStyle()),
        16.height,
        Container(
          padding: EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: radius(12),
            border: Border.all(color: colorLightGrey),
          ),
          child: Row(
            children: [
              Image.asset(mediTwo!,
                      height: 75, width: 75, fit: BoxFit.cover)
                  .cornerRadiusWithClipRRect(8.0),
              8.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  createRichText(
                    overflow: TextOverflow.ellipsis,
                    list: <TextSpan>[
                      TextSpan(
                          text: 'FisherMan Friend\'s Mandarin',
                          style: boldTextStyle()),
                      TextSpan(text: ''),
                    ],
                  ),
                  8.height,
                  Text(('Tablets : 50 pills').validate(),
                      style:
                          boldTextStyle(size: 14, color: Colors.grey.shade500)),
                  12.height,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.shopping_bag_outlined, size: 16),
                          Text('Quantity: ',
                              style: boldTextStyle(
                                  color: Colors.grey.shade500, size: 14)),
                          Text('02 ', style: boldTextStyle(color: black)),
                        ],
                      ),
                      Text('\$12.00',
                          style: boldTextStyle(size: 14, color: colorBlue)),
                    ],
                  ),
                  8.height,
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
