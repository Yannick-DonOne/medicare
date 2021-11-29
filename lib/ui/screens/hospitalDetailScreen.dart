import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicare/ui/components/hospitalDetailComponent.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:medicare/utils/Image.dart';
import 'package:nb_utils/nb_utils.dart';

class HospitalDetailScreen extends StatefulWidget {
  static String tag = '/MLHospitalDetailScreen';

  @override
  HospitalDetailScreenState createState() => HospitalDetailScreenState();
}

class HospitalDetailScreenState extends State<HospitalDetailScreen> {
  double containerHeight = 0;
  bool? liked = false;

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
      backgroundColor: primaryColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 450,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: primaryColor,
                  child: Stack(
                    children: [
                      Image.asset(hospital_img!,
                              fit: BoxFit.cover, width: context.width())
                          .cornerRadiusWithClipRRectOnly(topRight: 24),
                      Positioned(
                        top: 16.0,
                        right: 16.0,
                        child: iconWithRoundedContainer(Icons.close, black)
                            .onTap(() {
                          finish(context);
                        }),
                      ),
                      Positioned(
                        bottom: 16.0,
                        right: 16.0,
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: boxDecorationWithRoundedCorners(
                              backgroundColor: white,
                              border: Border.all(color: Colors.grey.shade100),
                              borderRadius: radius(24.0)),
                          child: liked == true
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      liked = false;
                                    });
                                  },
                                  child: Icon(Icons.favorite,
                                      color: Colors.red, size: 16),
                                )
                              : InkWell(
                                  onTap: () {
                                    setState(() {
                                      liked = true;
                                    });
                                  },
                                  child: Icon(Icons.favorite_outline,
                                      color: Colors.grey, size: 16),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) {
                    return Container(
                      decoration: boxDecorationWithRoundedCorners(
                        borderRadius: radiusOnly(topRight: 12, topLeft: 12),
                      ),
                      child: HospitalDetailComponent(),
                    );
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
