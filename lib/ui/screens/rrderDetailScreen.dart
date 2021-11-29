import 'package:flutter/material.dart';
import 'package:medicare/ui/components/orderTrackingComponent.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:nb_utils/nb_utils.dart';

class OrderDetailScreen extends StatefulWidget {
  static String tag = '/OrderDetailScreen';

  @override
  OrderDetailScreenState createState() => OrderDetailScreenState();
}

class OrderDetailScreenState extends State<OrderDetailScreen> {
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
        body: Column(
          children: [
            8.height,
            Row(
              children: [
                backToPreviousWidget(context, white),
                8.width,
                Text('Order Detail',
                        style: boldTextStyle(size: 24, color: white))
                    .expand(),
                Icon(Icons.info_outline, color: white, size: 24),
                8.width,
              ],
            ).paddingAll(16.0),
            8.height,
            Container(
              decoration: boxDecorationWithRoundedCorners(
                  borderRadius: radiusOnly(topRight: 32)),
              child: OrderTrackingDetailComponent(),
            ).expand(),
          ],
        ),
      ),
    );
  }
}
