import 'package:flutter/material.dart';
import 'package:medicare/ui/components/doctorDetailComponent.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Common.dart';
import 'package:medicare/utils/Image.dart';
import 'package:nb_utils/nb_utils.dart';

class DoctorDetailScreen extends StatefulWidget {
  static String tag = '/DoctorDetailScreen';

  @override
  DoctorDetailScreenState createState() => DoctorDetailScreenState();
}

class DoctorDetailScreenState extends State<DoctorDetailScreen> {
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
              expandedHeight: context.height() * 0.45,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: primaryColor,
                  child: Stack(
                    alignment: Alignment.topLeft,
                    children: [
                      Image.asset(doctor_image!,
                              fit: BoxFit.contain, width: context.width())
                          .paddingTop(16.0),
                      backToPreviousWidget(context, white)
                          .paddingOnly(left: 24, top: 24),
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
                      child: DoctorDetailComponent(),
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
