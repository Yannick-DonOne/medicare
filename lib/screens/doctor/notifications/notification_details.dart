
import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';

class NotificationDetails extends StatefulWidget {
  @override
  _NotificationDetailsState createState() => _NotificationDetailsState();
}

class _NotificationDetailsState extends State<NotificationDetails> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorScreen,
      appBar: AppBar(
        title: Text('Notification'),
        backgroundColor: primaryColor,
      ),
      body: FittedBox(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: whiteColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [BoxShadow(color: whiteColor, blurRadius: 2.0)]),
          child: Column(
            children: [
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                // style: kDarkTextStyle,
              ),
              SizedBox(height: 16.0),
              Image.asset('assets/images/logo.png'),
              SizedBox(height: 16.0),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                // style: TextStyle(color: kLightColor),
              ),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '11/Feb/2021 04:42 PM',
                  // style: TextStyle(color: kLightColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
