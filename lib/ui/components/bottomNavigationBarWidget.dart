import 'package:flutter/material.dart';
import 'package:medicare/utils/Common.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  static String tag = '/BottomNavigationBarWidget';
  final Function(int)? onTap;
  final int? index;

  BottomNavigationBarWidget({this.onTap, this.index});

  @override
  BottomNavigationBarWidgetState createState() => BottomNavigationBarWidgetState();
}

class BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
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
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey.shade400,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(fontSize: 0),
      unselectedLabelStyle: TextStyle(fontSize: 0),
      currentIndex: widget.index!,
      onTap: widget.onTap,
      items: [
        bottomNavigationItem(Icons.home_outlined),
        bottomNavigationItem(Icons.chat_bubble_outline),
        bottomNavigationItem(Icons.calendar_today_outlined),
        bottomNavigationItem(Icons.notifications_none),
        bottomNavigationItem(Icons.people_alt_outlined),
      ],
    );
  }

  bottomNavigationItem(IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: 22),
      label: '',
      activeIcon: selectedNavigationbarIcon(icon),
    );
  }
}
