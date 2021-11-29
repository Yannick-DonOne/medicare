import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medicare/ui/components/homeBottomComponent.dart';
import 'package:medicare/ui/components/homeTopComponent.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeFragment extends StatefulWidget {
  static String tag = '/HomeFragment';

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HomeTopComponent(),
            16.height,
            HomeBottomComponent(),
            64.height,
          ],
        ),
      ),
    );
  }
}
