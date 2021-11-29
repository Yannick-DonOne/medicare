import 'package:flutter/material.dart';
import 'package:medicare/ui/model/deliveredData.dart';
import 'package:medicare/ui/screens/rrderDetailScreen.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/DataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class DeliveredDataComponent extends StatefulWidget {
  static String tag = '/DeliveredDataComponent';

  @override
  DeliveredDataComponentState createState() =>
      DeliveredDataComponentState();
}

class DeliveredDataComponentState extends State<DeliveredDataComponent> {
  String? price = '\$12.00';
  List<DeliveredData> data = deliveredStatusDataList();

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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: data.map((e) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('23 October,2021', style: boldTextStyle())
                  .paddingOnly(top: 16.0, bottom: 16.0),
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    decoration: boxDecorationRoundedWithShadow(12),
                    child: Column(
                      children: [
                        16.height,
                        Row(
                          children: [
                            Image.asset(e.imageOne.validate(),
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
                                        text: e.medicineOne.validate(),
                                        style: boldTextStyle()),
                                    TextSpan(text: ''),
                                  ],
                                ),
                                8.height,
                                Text(('Tablets : 50 pills').validate(),
                                    style: secondaryTextStyle()),
                                12.height,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text('Quantity: ',
                                        style: boldTextStyle(
                                            color: Colors.grey.shade500,
                                            size: 14)),
                                    Text('02 ',
                                        style: boldTextStyle(color: black)),
                                    8.width,
                                    Text('\$12.00',
                                        style: boldTextStyle(
                                            size: 14, color: colorBlue)),
                                  ],
                                ),
                                8.height,
                              ],
                            ),
                          ],
                        ).paddingOnly(right: 16.0, left: 16.0),
                        8.height,
                        Divider(thickness: 0.5),
                        8.height,
                        Row(
                          children: [
                            Image.asset(e.imageTwo.validate(),
                                    height: 75, width: 75, fit: BoxFit.cover)
                                .cornerRadiusWithClipRRect(8.0),
                            8.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(e.medicineTwo.validate(),
                                    style: boldTextStyle()),
                                8.height,
                                Text(('Tablets : 50 pills').validate(),
                                    style: secondaryTextStyle()),
                                12.height,
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(Icons.shopping_bag_outlined, size: 16),
                                    Text('Quantity: ',
                                        style: boldTextStyle(
                                            color: Colors.grey.shade500,
                                            size: 14)),
                                    Text('02 ',
                                        style: boldTextStyle(color: black)),
                                    Text('\$12.00',
                                        style: boldTextStyle(
                                            size: 14, color: colorBlue)),
                                  ],
                                ),
                                8.height,
                              ],
                            ),
                          ],
                        ).paddingOnly(right: 16.0, left: 16.0),
                        Divider(thickness: 0.5),
                        8.height,
                        Row(
                          children: [
                            Text('Total: ', style: boldTextStyle()),
                            Text('\$300.00',
                                style: boldTextStyle(color: colorDarkBlue)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(' Detail',
                                    style: boldTextStyle(
                                        size: 14, color: colorDarkBlue)),
                                4.width,
                                Icon(Icons.arrow_forward,
                                    color: colorDarkBlue, size: 16),
                              ],
                            ).expand(),
                          ],
                        ).paddingOnly(right: 16.0, left: 16.0),
                        16.height,
                      ],
                    ),
                  ).paddingTop(8.0),
                  Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: boxDecorationWithRoundedCorners(
                      backgroundColor:
                          (e.status == 'Pending') ? Colors.orange : colorBlue,
                      borderRadius: radius(20),
                    ),
                    child: Text((e.status).validate(),
                            style: secondaryTextStyle(color: white))
                        .paddingOnly(right: 10.0, left: 10.0),
                  ).paddingLeft(16.0),
                ],
              ),
            ],
          ).paddingBottom(16.0).onTap(() {
            OrderDetailScreen().launch(context);
          });
        }).toList(),
      ).paddingOnly(right: 16.0, left: 16.0),
    );
  }
}
