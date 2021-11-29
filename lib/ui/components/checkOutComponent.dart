import 'package:flutter/material.dart';
import 'package:medicare/ui/model/deliveredData.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/DataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class CheckOutComponent extends StatefulWidget {
  static String tag = '/CheckOutComponent';

  @override
  CheckOutComponentState createState() => CheckOutComponentState();
}

class CheckOutComponentState extends State<CheckOutComponent> {
  List<DeliveredData> data = deliveredDataList();

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
        children: [
          16.height,
          Container(
            decoration: boxDecorationWithRoundedCorners(
                border: Border.all(color: colorLightGrey)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                8.height,
                Text('Order will be delivered by 18:00 Tomorrow',
                    style: secondaryTextStyle(size: 16, color: black)),
                8.height,
                Divider(height: 0.5),
                Column(
                  children: data.map((e) {
                    return Row(
                      children: [
                        Image.asset((e.imageOne).validate(),
                                height: 90, width: 90, fit: BoxFit.cover)
                            .cornerRadiusWithClipRRect(8.0),
                        8.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text((e.medicineOne).validate(),
                                style: boldTextStyle()),
                            6.height,
                            Text(('Tablets : 50 pills').validate(),
                                style: secondaryTextStyle()),
                            8.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.shopping_bag_outlined,
                                    size: 18, color: textSecondaryColorGlobal),
                                Text('Quantity: ',
                                    style: boldTextStyle(
                                        size: 14,
                                        color: textSecondaryColorGlobal)),
                                Text('02', style: boldTextStyle(size: 14)),
                                50.width,
                                Text('\$12.00',
                                    style: boldTextStyle(
                                        size: 14, color: colorBlue)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ).paddingAll(8.0);
                  }).toList(),
                )
              ],
            ),
          ),
          64.height,
        ],
      ).paddingAll(16.0),
    );
  }
}
