import 'package:flutter/material.dart';
import 'package:medicare/ui/components/categoryComponent.dart';
import 'package:medicare/ui/components/categoryProductComponent.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:nb_utils/nb_utils.dart';

class OnlinePharmacyDetailScreen extends StatefulWidget {
  static String tag = '/OnlinePharmacyDetailScreen';
  final int? index;

  OnlinePharmacyDetailScreen({this.index});

  @override
  OnlinePharmacyDetailScreenState createState() =>
      OnlinePharmacyDetailScreenState();
}

class OnlinePharmacyDetailScreenState
    extends State<OnlinePharmacyDetailScreen> {
  List<Widget> data = [CategoryComponent(), CategoryProductComponent()];

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
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    backToPreviousWidget(context, white),
                    8.width,
                    Text('Online Pharmacy',
                            style: boldTextStyle(color: whiteColor, size: 20))
                        .expand(),
                    Icon(Icons.home_outlined, color: white, size: 24),
                    8.width,
                    Icon(Icons.shopping_bag_outlined, color: white, size: 24),
                  ],
                ),
                8.height,
                Row(
                  children: [
                    Text('Online Pharmacy ',
                        style: secondaryTextStyle(
                            size: 12, color: white.withOpacity(0.3))),
                    (widget.index == 0)
                        ? Text('> Prescription Drug',
                            style: secondaryTextStyle(
                                size: 12, color: white.withOpacity(0.3)))
                        : Text('> Prescription Drug > Analgesic',
                            style: secondaryTextStyle(
                                size: 12, color: white.withOpacity(0.3))),
                  ],
                ).paddingLeft(8.0),
              ],
            ).paddingAll(16.0),
            data[widget.index!].validate().flexible(),
          ],
        ),
      ),
    );
  }
}
