import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medicare/ui/components/pharmacyCategoriesComponent.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:medicare/utils/Image.dart';
import 'package:nb_utils/nb_utils.dart';

class OnlinePharmacyScreen extends StatefulWidget {
  static String tag = '/OnlinePharmacyScreen';

  @override
  OnlinePharmacyScreenState createState() => OnlinePharmacyScreenState();
}

class OnlinePharmacyScreenState extends State<OnlinePharmacyScreen> {
  PageController controller = PageController(
    viewportFraction: 0.8,
    initialPage: 0,
  );
  List<String> slides = <String>[
    pharmacySlide3!,
    pharmacySlide1!,
    pharmacySlide2!,
    pharmacySlide4!,
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 450,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          backToPreviousWidget(context, white),
                          8.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Your Location',
                                  style: secondaryTextStyle(
                                      size: 12, color: white.withOpacity(0.5))),
                              4.height,
                              Text('35 St Martin\'s St West end',
                                  style: boldTextStyle(size: 14, color: white)),
                            ],
                          ),
                        ],
                      ).paddingAll(16.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Online',
                                  style: boldTextStyle(size: 32, color: white)),
                              Text('Pharmacy',
                                  style: boldTextStyle(size: 32, color: white)),
                            ],
                          ).expand(),
                          Icon(Icons.search, color: white, size: 24),
                          8.width,
                          Icon(Icons.shopping_bag_outlined,
                              color: white, size: 24),
                        ],
                      ).paddingAll(16.0),
                      8.height,
                      Container(
                        height: 180,
                        width: context.width(),
                        child: PageView(
                          controller: controller,
                          children: slides.map((e) {
                            return Image.asset(e.validate(), fit: BoxFit.fill)
                                .cornerRadiusWithClipRRect(12.0)
                                .paddingRight(16.0);
                          }).toList(),
                        ),
                      ),
                      16.height,
                      DotIndicator(
                          pageController: controller,
                          pages: slides,
                          unselectedIndicatorColor: white.withOpacity(0.5)),
                      16.height,
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) {
                    return PharmacyCategoriesComponent();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
