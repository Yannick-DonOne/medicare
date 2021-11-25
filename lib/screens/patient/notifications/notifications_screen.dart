import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:medicare/utils/theme/theme.dart';

class PatientNotificationsScreen extends StatefulWidget {
  static String id = 'notifications_screen';
  const PatientNotificationsScreen({Key? key}) : super(key: key);

  @override
  _PatientNotificationsScreenState createState() =>
      _PatientNotificationsScreenState();
}

class _PatientNotificationsScreenState
    extends State<PatientNotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    double width;
    double height;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: whiteColor,
        title: Text(
          "Notifications".toString(),
          style: TextStyle(
              fontSize: 18, color: primaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: 5,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: width * 0.01, vertical: width * 0.02),
                  child: Row(
                    children: [
                      Container(
                        width: width * 0.15,
                        alignment: AlignmentDirectional.center,
                        margin: EdgeInsets.symmetric(
                            horizontal: width * 0.01, vertical: width * 0.02),
                        child: Column(
                          children: [
                            Container(
                              width: width * 0.15,
                              height: height * 0.065,
                              child: CachedNetworkImage(
                                alignment: Alignment.center,
                                imageUrl:
                                    "userNotification[index].doctor!.fullImage!",
                                imageBuilder: (context, imageProvider) =>
                                    CircleAvatar(
                                  radius: 50,
                                  backgroundColor: primaryColor,
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundImage: imageProvider,
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    // CircularProgressIndicator(),
                                    SpinKitFadingCircle(color: primaryColor),
                                errorWidget: (context, url, error) =>
                                    Image.asset("assets/images/no_image.jpg"),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: width * 0.8,
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text(
                                        "Yannick DonOne",
                                        style: TextStyle(
                                            fontSize: width * 0.04,
                                            color: primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '${DateTime.now().day}' +
                                            '-' '${DateTime.now().month}' +
                                            '-'
                                                '${DateTime.now().year}'
                                                '  '
                                                '${DateTime.now().hour}' +
                                            ':' '${DateTime.now().minute}',
                                        style: TextStyle(
                                          fontSize: width * 0.03,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: AlignmentDirectional.topStart,
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elnisi.", // Notification message.
                                  style: TextStyle(
                                    fontSize: width * 0.035,
                                    color: primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
