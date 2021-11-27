import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';

class PatientDrawer extends StatefulWidget {
  const PatientDrawer({Key? key}) : super(key: key);

  @override
  _PatientDrawerState createState() => _PatientDrawerState();
}

class _PatientDrawerState extends State<PatientDrawer> {
  String? image = "";

  String? name = "";
  String? email = "";
  String? phoneNo = "";

  @override
  Widget build(BuildContext context) {
    double width;

    width = MediaQuery.of(context).size.width;
    return Drawer(
      child: Column(
        children: [
          // SharedPreferenceHelper.getBoolean(Preferences.is_logged_in) == true
          //     ? Expanded(
          //         flex: 3,
          //         child: DrawerHeader(
          //           child: Container(
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Container(
          //                   width: 60,
          //                   height: 80,
          //                   alignment: AlignmentDirectional.center,
          //                   decoration: new BoxDecoration(
          //                     shape: BoxShape
          //                         .circle, // BoxShape.circle or BoxShape.retangle
          //                     boxShadow: [
          //                       new BoxShadow(
          //                         color: primaryColor,
          //                         blurRadius: 1.0,
          //                       ),
          //                     ],
          //                   ),
          //                   child: CachedNetworkImage(
          //                     alignment: Alignment.center,
          //                     imageUrl: image!,
          //                     imageBuilder: (context, imageProvider) =>
          //                         CircleAvatar(
          //                       radius: 50,
          //                       backgroundColor: whiteColor,
          //                       child: CircleAvatar(
          //                         radius: 30,
          //                         backgroundImage: imageProvider,
          //                       ),
          //                     ),
          //                     placeholder: (context, url) =>
          //                         SpinKitFadingCircle(color: primaryColor),
          //                     errorWidget: (context, url, error) =>
          //                         Image.asset("assets/images/no_image.jpg"),
          //                   ),
          //                 ),
          //                 Container(
          //                   width: 150,
          //                   height: 55,
          //                   child: Padding(
          //                     padding: const EdgeInsets.only(left: 5),
          //                     child: Column(
          //                       mainAxisAlignment:
          //                           MainAxisAlignment.spaceEvenly,
          //                       children: [
          //                         Container(
          //                           alignment: AlignmentDirectional.topStart,
          //                           child: Text(
          //                             '$name',
          //                             style: TextStyle(
          //                               fontSize: width * 0.05,
          //                               color: primaryColor,
          //                             ),
          //                             overflow: TextOverflow.ellipsis,
          //                           ),
          //                         ),
          //                         Container(
          //                           alignment: AlignmentDirectional.topStart,
          //                           child: Text(
          //                             '$email',
          //                             style: TextStyle(
          //                               fontSize: width * 0.035,
          //                               color: grey,
          //                             ),
          //                             overflow: TextOverflow.ellipsis,
          //                           ),
          //                         ),
          //                         Container(
          //                           alignment: AlignmentDirectional.topStart,
          //                           child: Text(
          //                             '$phone_no',
          //                             style: TextStyle(
          //                               fontSize: width * 0.035,
          //                               color: grey,
          //                             ),
          //                           ),
          //                         )
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //                 Container(
          //                   alignment: AlignmentDirectional.center,
          //                   margin: EdgeInsets.only(top: 20),
          //                   child: Padding(
          //                     padding: const EdgeInsets.all(10),
          //                     child: GestureDetector(
          //                       onTap: () {
          //                         Navigator.pushNamed(context, 'profile');
          //                       },
          //                       child: SvgPicture.asset(
          //                         'assets/icons/edit.svg',
          //                         height: 20,
          //                         width: 20,
          //                       ),
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //       )
          //     :
          DrawerHeader(
            child: Container(
              alignment: AlignmentDirectional.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'SignIn');
                    },
                    child: Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width * 0.06),
                        ),
                        color: whiteColor,
                        shadowColor: grey,
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 8),
                          child:
                              // CustomButton(
                              //   child: Text(''),
                              //   gradient: CustomTheme.buttonGradient,
                              //   onPressed: () {},
                              // ),

                              Text(
                            'Sign In'.toString(),
                            style: TextStyle(
                                fontSize: width * 0.04, color: primaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.pushNamed(context, 'signup');
                  //   },
                  //   child: Container(
                  //     child: Card(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(width * 0.06),
                  //       ),
                  //       color: whiteColor,
                  //       shadowColor: grey,
                  //       elevation: 5,
                  //       child: Padding(
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: 20, vertical: 8),
                  //         child: CustomButton(
                  //           child: Text(''),
                  //           gradient: CustomTheme.buttonGradient,
                  //           onPressed: () {},
                  //         ),
                  //         //  Text(
                  //         //   getTranslated(context, home_signUp_button)
                  //         //       .toString(),
                  //         //   style: TextStyle(
                  //         //     fontSize: width * 0.04,
                  //         //     color: primaryColor,
                  //         //   ),
                  //         // ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Container(
            // margin: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ListTile(
                  onTap: () {
                    Navigator.popAndPushNamed(context, 'Specialist');
                  },
                  title: Text(
                    'Find Doctor  &  Book Appointment',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: primaryColor,
                    ),
                  ),
                ),
                // Container(
                //   // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                //   child: Column(
                //     children: [
                //       // DottedLine(
                //       //   direction: Axis.horizontal,
                //       //   lineLength: double.infinity,
                //       //   lineThickness: 1.0,
                //       //   dashLength: 3.0,
                //       //   dashColor: Palette.dash_line,
                //       //   dashRadius: 0.0,
                //       //   dashGapLength: 1.0,
                //       //   dashGapColor: Palette.transparent,
                //       //   dashGapRadius: 0.0,
                //       // ),
                //     ],
                //   ),
                // ),

                ListTile(
                  onTap: () {
                    // SharedPreferenceHelper.getBoolean(
                    //             Preferences.is_logged_in) ==
                    //         true
                    //     ? Navigator.popAndPushNamed(context, 'Appointment')
                    //     : FormHelper.showMessage(
                    //         context,
                    //         getTranslated(
                    //                 context, home_medicineOrder_alert_title)
                    //             .toString(),
                    //         getTranslated(
                    //                 context, home_medicineOrder_alert_text)
                    //             .toString(),
                    //         getTranslated(context, cancel).toString(),
                    //         () {
                    //           Navigator.of(context).pop();
                    //         },
                    //         buttonText2:
                    //             getTranslated(context, login).toString(),
                    //         isConfirmationDialog: true,
                    //         onPressed2: () {
                    //           Navigator.pushNamed(context, 'SignIn');
                    //         },
                    //       );
                  },
                  title: Text(
                    'Appointments',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: primaryColor,
                    ),
                  ),
                ),
                // Container(
                //     margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                //     child: Container()
                //     // Column(
                //     //   children: [
                //     //     // DottedLine(
                //     //     //   direction: Axis.horizontal,
                //     //     //   lineLength: double.infinity,
                //     //     //   lineThickness: 1.0,
                //     //     //   dashLength: 3.0,
                //     //     //   dashColor: Palette.dash_line,
                //     //     //   dashRadius: 0.0,
                //     //     //   dashGapLength: 1.0,
                //     //     //   dashGapColor: Palette.transparent,
                //     //     //   dashGapRadius: 0.0,
                //     //     // )
                //     //   ],
                //     // ),
                //     ),

                ListTile(
                  onTap: () {
                    // SharedPreferenceHelper.getBoolean(
                    //             Preferences.is_logged_in) ==
                    //         true
                    //     ? Navigator.popAndPushNamed(context, 'Favoritedoctor')
                    //     : FormHelper.showMessage(
                    //         context,
                    //         getTranslated(
                    //                 context, home_favoriteDoctor_alert_title)
                    //             .toString(),
                    //         getTranslated(
                    //                 context, home_favoriteDoctor_alert_text)
                    //             .toString(),
                    //         getTranslated(context, cancel).toString(),
                    //         () {
                    //           Navigator.of(context).pop();
                    //         },
                    //         buttonText2:
                    //             getTranslated(context, login).toString(),
                    //         isConfirmationDialog: true,
                    //         onPressed2: () {
                    //           Navigator.pushNamed(context, 'SignIn');
                    //         },
                    //       );
                  },
                  title: Text(
                    'Favorites Doctor',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: primaryColor,
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                //   child: Column(
                //     children: [
                //       // DottedLine(
                //       //   direction: Axis.horizontal,
                //       //   lineLength: double.infinity,
                //       //   lineThickness: 1.0,
                //       //   dashLength: 3.0,
                //       //   dashColor: Palette.dash_line,
                //       //   dashRadius: 0.0,
                //       //   dashGapLength: 1.0,
                //       //   dashGapColor: Palette.transparent,
                //       //   dashGapRadius: 0.0,
                //       // )
                //     ],
                //   ),
                // ),

                ListTile(
                  onTap: () {
                    Navigator.popAndPushNamed(context, 'AllPharamacy');
                  },
                  title: Text(
                    'Medicine Buy',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: primaryColor,
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                //   child: Column(
                //     children: [
                //       // DottedLine(
                //       //   direction: Axis.horizontal,
                //       //   lineLength: double.infinity,
                //       //   lineThickness: 1.0,
                //       //   dashLength: 3.0,
                //       //   dashColor: Palette.dash_line,
                //       //   dashRadius: 0.0,
                //       //   dashGapLength: 1.0,
                //       //   dashGapColor: Palette.transparent,
                //       //   dashGapRadius: 0.0,
                //       // )
                //     ],
                //   ),
                // ),

                ListTile(
                  onTap: () {
                    // SharedPreferenceHelper.getBoolean(
                    //             Preferences.is_logged_in) ==
                    //         true
                    //     ? Navigator.popAndPushNamed(context, 'MedicineOrder')
                    //     : FormHelper.showMessage(
                    //         context,
                    //         getTranslated(
                    //                 context, home_medicineBuy_alert_title)
                    //             .toString(),
                    //         getTranslated(
                    //                 context, home_medicineBuy_alert_text)
                    //             .toString(),
                    //         getTranslated(context, cancel).toString(),
                    //         () {
                    //           Navigator.of(context).pop();
                    //         },
                    //         buttonText2:
                    //             getTranslated(context, login).toString(),
                    //         isConfirmationDialog: true,
                    //         onPressed2: () {
                    //           Navigator.pushNamed(context, 'SignIn');
                    //         },
                    //       );
                  },
                  title: Text(
                    'Order History',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: primaryColor,
                    ),
                  ),
                ),

                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                //   child: Column(
                //     children: [
                //       // DottedLine(
                //       //   direction: Axis.horizontal,
                //       //   lineLength: double.infinity,
                //       //   lineThickness: 1.0,
                //       //   dashLength: 3.0,
                //       //   dashColor: Palette.dash_line,
                //       //   dashRadius: 0.0,
                //       //   dashGapLength: 1.0,
                //       //   dashGapColor: Palette.transparent,
                //       //   dashGapRadius: 0.0,
                //       // )
                //     ],
                //   ),
                // ),

                ListTile(
                  onTap: () {
                    Navigator.popAndPushNamed(context, 'HealthTips');
                  },
                  title: Text(
                    'Health Tips',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: primaryColor,
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                //   child: Column(
                //     children: [
                //       // DottedLine(
                //       //   direction: Axis.horizontal,
                //       //   lineLength: double.infinity,
                //       //   lineThickness: 1.0,
                //       //   dashLength: 3.0,
                //       //   dashColor: Palette.dash_line,
                //       //   dashRadius: 0.0,
                //       //   dashGapLength: 1.0,
                //       //   dashGapColor: Palette.transparent,
                //       //   dashGapRadius: 0.0,
                //       // )
                //     ],
                //   ),
                // ),

                ListTile(
                  onTap: () {
                    Navigator.popAndPushNamed(context, 'Offer');
                  },
                  title: Text(
                    'Offers',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: primaryColor,
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                //   child: Column(
                //     children: [
                //       // DottedLine(
                //       //   direction: Axis.horizontal,
                //       //   lineLength: double.infinity,
                //       //   lineThickness: 1.0,
                //       //   dashLength: 3.0,
                //       //   dashColor: Palette.dash_line,
                //       //   dashRadius: 0.0,
                //       //   dashGapLength: 1.0,
                //       //   dashGapColor: Palette.transparent,
                //       //   dashGapRadius: 0.0,
                //       // )
                //     ],
                //   ),
                // ),

                ListTile(
                  onTap: () {
                    // SharedPreferenceHelper.getBoolean(
                    //             Preferences.is_logged_in) ==
                    //         true
                    //     ? Navigator.popAndPushNamed(context, 'notifications')
                    //     : FormHelper.showMessage(
                    //         context,
                    //         getTranslated(
                    //                 context, home_notification_alert_title)
                    //             .toString(),
                    //         getTranslated(
                    //                 context, home_notification_alert_text)
                    //             .toString(),
                    //         getTranslated(context, cancel).toString(),
                    //         () {
                    //           Navigator.of(context).pop();
                    //         },
                    //         buttonText2:
                    //             getTranslated(context, login).toString(),
                    //         isConfirmationDialog: true,
                    //         onPressed2: () {
                    //           Navigator.pushNamed(context, 'SignIn');
                    //         },
                    //       );
                  },
                  title: Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: primaryColor,
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                //   child: Column(
                //     children: [
                //       // DottedLine(
                //       //   direction: Axis.horizontal,
                //       //   lineLength: double.infinity,
                //       //   lineThickness: 1.0,
                //       //   dashLength: 3.0,
                //       //   dashColor: Palette.dash_line,
                //       //   dashRadius: 0.0,
                //       //   dashGapLength: 1.0,
                //       //   dashGapColor: Palette.transparent,
                //       //   dashGapRadius: 0.0,
                //       // )
                //     ],
                //   ),
                // ),

                ListTile(
                  onTap: () {
                    Navigator.popAndPushNamed(context, 'Setting');
                  },
                  title: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: primaryColor,
                    ),
                  ),
                ),
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                //   child: Column(
                //     children: [
                //       // DottedLine(
                //       //   direction: Axis.horizontal,
                //       //   lineLength: double.infinity,
                //       //   lineThickness: 1.0,
                //       //   dashLength: 2.0,
                //       //   dashColor: Palette.dash_line,
                //       //   dashRadius: 0.0,
                //       //   dashGapLength: 1.0,
                //       //   dashGapColor: Palette.transparent,
                //       //   dashGapRadius: 0.0,
                //       // )
                //     ],
                //   ),
                // ),

                ListTile(
                    title: GestureDetector(
                  onTap: () {
                    // FormHelper.showMessage(
                    //   context,
                    //   getTranslated(context, home_logout_alert_title)
                    //       .toString(),
                    //   getTranslated(context, home_logout_alert_text)
                    //       .toString(),
                    //   getTranslated(context, cancel).toString(),
                    //   () {
                    //     Navigator.of(context).pop();
                    //   },
                    //   buttonText2: getTranslated(
                    //           context, home_logout_alert_title)
                    //       .toString(),
                    //   isConfirmationDialog: true,
                    //   onPressed2: () {
                    //     Preferences.checkNetwork().then((value) =>
                    //         value == true
                    //             ? logoutUser()
                    //             : print('No int'));
                    //   },
                    // );
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: width * 0.04,
                      color: primaryColor,
                    ),
                  ),
                )
                    // : Text(
                    //     '',
                    //     style: TextStyle(
                    //       fontSize: width * 0.04,
                    //       color: primaryColor,
                    //     ),
                    //   ),
                    ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
