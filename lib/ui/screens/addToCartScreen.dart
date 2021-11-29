import 'package:flutter/material.dart';
import 'package:medicare/ui/components/checkOutComponent.dart';
import 'package:medicare/ui/components/shoppingCartComponent.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'confirmOrderScreen.dart';

class AddToCartScreen extends StatefulWidget {
  static String tag = '/ShoppingCartScreen';

  @override
  AddToCartScreenState createState() => AddToCartScreenState();
}

class AddToCartScreenState extends State<AddToCartScreen> {
  int currentWidget = 0;

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
            Container(
              height: context.height(),
              decoration: boxDecorationWithRoundedCorners(
                  borderRadius: radiusOnly(topRight: 32)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    8.height,
                    Row(
                      children: [
                        Icon(Icons.arrow_back_ios, color: blackColor, size: 24)
                            .onTap(() {
                          currentWidget == 0
                              ? Navigator.of(context).pop()
                              : setState(() {
                                  currentWidget--;
                                });
                        }),
                        currentWidget == 0
                            ? Row(
                                children: [
                                  Text('Shopping Cart',
                                      style: boldTextStyle(size: 24)),
                                  8.width,
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: boxDecorationWithRoundedCorners(
                                        backgroundColor: colorDarkBlue,
                                        boxShape: BoxShape.circle),
                                    child: Text('3',
                                        style: secondaryTextStyle(
                                            size: 18, color: white)),
                                  ),
                                ],
                              )
                            : Text('Check Out', style: boldTextStyle(size: 24)),
                      ],
                    ).paddingAll(16.0),
                    8.height,
                    Column(
                      children: [
                        Divider(height: 0.5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('Address Shipping', style: boldTextStyle())
                                    .expand(),
                                Text('Change',
                                    style: boldTextStyle(color: colorBlue)),
                              ],
                            ),
                            8.height,
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined,
                                    color: Colors.grey.shade500, size: 18),
                                4.width,
                                Text('23 Estean, New York City, USA',
                                    style: secondaryTextStyle(
                                        color: Colors.grey.shade500)),
                              ],
                            )
                          ],
                        ).paddingAll(16.0),
                        Divider(height: 0.5),
                        currentWidget == 0
                            ? ShoppingCartComponent()
                            : CheckOutComponent(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                width: context.width(),
                padding: EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 8.0, top: 8.0),
                decoration: boxDecorationWithRoundedCorners(
                  borderRadius: radius(0.0),
                  backgroundColor: white,
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 0.0)],
                ),
                child: currentWidget == 0
                    ? Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          8.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total',
                                  style: secondaryTextStyle(size: 16)),
                              Text('\$250.00', style: boldTextStyle()),
                            ],
                          ),
                          32.width,
                          AppButton(
                            color: colorDarkBlue,
                            onTap: () {
                              setState(() {
                                currentWidget++;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Check Out',
                                    style: boldTextStyle(color: white)),
                                4.width,
                                Icon(Icons.arrow_forward_ios,
                                    color: white, size: 16),
                              ],
                            ),
                          ).expand()
                        ],
                      )
                    : AppButton(
                        color: colorDarkBlue,
                        width: context.width() / 2,
                        onTap: () {
                          setState(() {
                            ConfirmOrderScreen().launch(context);
                          });
                        },
                        child: Text('Confirm',
                            style: secondaryTextStyle(color: white)),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
