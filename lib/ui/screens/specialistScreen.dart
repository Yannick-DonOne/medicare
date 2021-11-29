import 'package:flutter/material.dart';
import 'package:medicare/ui/components/specialistVLIstComponent.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:nb_utils/nb_utils.dart';

class SpecialistScreen extends StatefulWidget {
  static String tag = '/SpecialistScreen';

  @override
  SpecialistScreenState createState() => SpecialistScreenState();
}

class SpecialistScreenState extends State<SpecialistScreen> {
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
        body: Container(
          decoration: boxDecorationWithRoundedCorners(
              borderRadius: radiusOnly(topRight: 32)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              8.height,
              Row(
                children: [
                  8.width,
                  Icon(Icons.arrow_back_ios, size: 24).onTap(() {
                    finish(context);
                  }),
                  8.width,
                  Text('Specialist', style: boldTextStyle(size: 20)).expand(),
                ],
              ),
              16.height,
              SpecialistVListComponent().expand()
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
