import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medicare/ui/components/dieaseaseSymptomsComponent.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Image.dart';
import 'package:nb_utils/nb_utils.dart';

import 'bookAppointmentScreen.dart';

class DieaseseSymptomsScreen extends StatefulWidget {
  static String tag = '/DieaseaseSymptomsScreen';

  @override
  DieaseseSymptomsScreenState createState() =>
      DieaseseSymptomsScreenState();
}

class DieaseseSymptomsScreenState extends State<DieaseseSymptomsScreen> {
  PageController controller = PageController(
    viewportFraction: 0.8,
    initialPage: 0,
  );
  List<String> slides = <String>[diseaseSlide1!, diseaseSlide2!];

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
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(30))),
                  backgroundColor: white,
                  automaticallyImplyLeading: false,
                  expandedHeight: 400,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      child: Container(
                        decoration: boxDecorationWithRoundedCorners(
                            borderRadius: radiusOnly(topRight: 32)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            8.height,
                            Row(
                              children: [
                                Icon(Icons.arrow_back_ios,
                                        color: black, size: 20)
                                    .onTap(() {
                                  finish(context);
                                }),
                                8.width,
                                Text('Disease Symptoms',
                                        style: boldTextStyle(color: black))
                                    .center()
                                    .expand(),
                                Icon(Icons.home_outlined,
                                    color: black, size: 24),
                              ],
                            ).paddingAll(16.0),
                            Divider(height: 0.5),
                            16.height,
                            Text('Covid-19 (Corona Virus)',
                                    style:
                                        boldTextStyle(size: 24, color: black))
                                .paddingOnly(left: 16),
                            8.height,
                            Text('Corona Disease',
                                    style: secondaryTextStyle(
                                        size: 16, color: Colors.grey))
                                .paddingOnly(left: 16),
                            16.height,
                            Container(
                              color: white,
                              height: 200,
                              width: context.width(),
                              child: PageView(
                                controller: controller,
                                children: slides.map((e) {
                                  return Image.asset(e.validate(),
                                          width: context.width(),
                                          fit: BoxFit.cover)
                                      .cornerRadiusWithClipRRect(12)
                                      .paddingRight(16);
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      print('data');
                      if (index == 0) {
                        return DiseaseSymptomsComponent();
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
                BookAppointmentScreen(index: 0).launch(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Book Appointment ', style: boldTextStyle(color: white)),
                  Icon(Icons.arrow_forward_ios, color: white, size: 16),
                ],
              ),
            ).paddingOnly(right: 16, left: 16, bottom: 16),
          ],
        ),
      ),
    );
  }
}
