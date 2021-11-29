import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medicare/ui/components/profileBottomComponent.dart';
import 'package:medicare/utils/Colors.dart';
import 'package:medicare/utils/Image.dart';
import 'package:nb_utils/nb_utils.dart';

class ProfileFragment extends StatefulWidget {
  static String tag = '/ProfileFragment';

  @override
  ProfileFragmentState createState() => ProfileFragmentState();
}

class ProfileFragmentState extends State<ProfileFragment> {
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
              expandedHeight: 225,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: colorDarkBlue,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          child: Image.asset(profile_picture!),
                          radius: 40.0,
                          backgroundColor: colorCyan),
                      8.height,
                      Text('Kaixa Pham',
                          style: boldTextStyle(color: white, size: 24)),
                      4.height,
                      Text('johnsmith@gmail.com',
                          style: secondaryTextStyle(color: white, size: 16)),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) {
                    return ProfileBottomComponent();
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
