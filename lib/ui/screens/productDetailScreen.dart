import 'package:flutter/material.dart';
import 'package:medicare/ui/components/productDetailComponent.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:medicare/utils/Image.dart';
import 'package:nb_utils/nb_utils.dart';

import 'addToCartScreen.dart';

class ProductDetailScreen extends StatefulWidget {
  static String tag = '/ProductDetailScreen';

  @override
  ProductDetailScreenState createState() => ProductDetailScreenState();
}

class ProductDetailScreenState extends State<ProductDetailScreen> {
  List<String?> slides = [
    mediTwo,
    mediThree,
    mediFour,
    mediFive
  ];
  PageController controller = PageController();

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
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  backgroundColor: white,
                  automaticallyImplyLeading: false,
                  expandedHeight: 250,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Container(
                          width: double.infinity,
                          height: context.height() * 0.42,
                          color: Colors.grey.shade50,
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              PageView(
                                controller: controller,
                                children: slides.map((e) {
                                  return Image.asset(e.validate(),
                                      fit: BoxFit.cover);
                                }).toList(),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        right: 16.0, left: 16.0),
                                    decoration: boxDecorationWithRoundedCorners(
                                      backgroundColor: Colors.blue.shade600,
                                      borderRadius: radius(24),
                                    ),
                                    child: Text('-30%',
                                        style: secondaryTextStyle(
                                            color: white, size: 16)),
                                  ),
                                  DotIndicator(
                                      indicatorColor: black,
                                      unselectedIndicatorColor: Colors.grey,
                                      pageController: controller,
                                      pages: slides),
                                  SizedBox(width: context.width() * 0.25)
                                ],
                              ).paddingOnly(left: 16.0, bottom: 16.0),
                            ],
                          ),
                        ),
                        backToPreviousWidget(context, black)
                            .paddingOnly(left: 16, top: 16)
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      if (index == 0) {
                        return ProductDetailComponent();
                      }
                    },
                  ),
                ),
              ],
            ),
            AppButton(
              color: primaryColor,
              width: context.width(),
              onTap: () {
                finish(context);
                finish(context);
                finish(context);
                AddToCartScreen().launch(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Add to Cart', style: boldTextStyle(color: white)),
                  4.width,
                  Icon(Icons.shopping_bag_outlined, color: white),
                ],
              ),
            ).paddingOnly(right: 16.0, left: 16.0, bottom: 8.0),
          ],
        ),
      ),
    );
  }
}
