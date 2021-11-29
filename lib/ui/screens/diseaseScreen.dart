import 'package:flutter/material.dart';
import 'package:medicare/ui/components/dieaseaseComponent.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Image.dart';
import 'package:medicare/utils/String.dart';
import 'package:nb_utils/nb_utils.dart';

import 'searchDiseaseScreen.dart';

class DiseaseScreen extends StatefulWidget {
  static String tag = '/DiseaseScreen';

  @override
  DiseaseScreenState createState() => DiseaseScreenState();
}

class DiseaseScreenState extends State<DiseaseScreen> {
  PageController controller = PageController(
    viewportFraction: 0.8,
    initialPage: 0,
  );
  List<String> slides = <String>[
    diseaseSlide1!,
    diseaseSlide2!,
    diseaseSlide3!,
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
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.arrow_back_ios, color: white, size: 20)
                              .onTap(() {
                            finish(context);
                          }),
                          8.width,
                          Text(disease_symptoms!,
                                  style: boldTextStyle(size: 20, color: white))
                              .expand(),
                          Icon(Icons.search, color: white, size: 24).onTap(() {
                            SearchDiseaseScreen().launch(context);
                          })
                        ],
                      ).paddingAll(16.0),
                      16.height,
                      Container(
                        height: 170,
                        child: PageView(
                          controller: controller,
                          children: slides.map((e) {
                            return Image.asset(e.validate(), fit: BoxFit.fill)
                                .cornerRadiusWithClipRRect(12.0)
                                .paddingOnly(right: 16);
                          }).toList(),
                        ),
                      ),
                      16.height,
                      DotIndicator(
                        pageController: controller,
                        pages: slides,
                        unselectedIndicatorColor: white.withOpacity(0.5),
                      ),
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
                    return DieaseaseComponent();
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
