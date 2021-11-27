import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medicare/core/models/Appointments.dart';
import 'package:medicare/screens/patient/appointments/patientBookSpecialist.dart';
import 'package:medicare/utils/theme/theme.dart';

import 'book_appointment.dart';

class PatientAppointments extends StatefulWidget {
  static String id = 'patient_appointments';
  @override
  _PatientAppointmentsState createState() => _PatientAppointmentsState();
}

class _PatientAppointmentsState extends State<PatientAppointments> {
  void _deleteAppointment(String appID) {}

  final isDialOpen = ValueNotifier(false);

  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        _deleteAppointment('pass appointment id');
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirm Delete"),
      content: Text("Are you sure you want to delete this Appointment?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  List<UpcomingAppointment> upcomingAppointment = [];
  List<PastAppointment> pastAppointment = [];
  // List<PendingAppointment> pendingAppointment = [];
  List pendingAppointment = ['', 3, 5];

  List<String> cancelReason = [];
  String reason = "";
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    double width;
    double height;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        if (isDialOpen.value) {
          isDialOpen.value = false;
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: bgColorScreen,
        floatingActionButton: SpeedDial(
          backgroundColor: primaryColor,
          icon: Icons.add,
          activeIcon: Icons.close,
          spacing: 10,
          spaceBetweenChildren: 5,
          openCloseDial: isDialOpen,
          children: [
            SpeedDialChild(
              child: Icon(
                FontAwesomeIcons.clinicMedical,
              ),
              label: 'consultation',
              onTap: () {
                Navigator.pushNamed(context, PatientBookappointment.id);
              },
            ),
            SpeedDialChild(
              child: Icon(
                FontAwesomeIcons.userMd,
              ),
              label: 'book Specialist',
              onTap: () {
                Navigator.pushNamed(context, SelectSpecialist.id);
              },
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     Navigator.pushNamed(context, PatientBookappointment.id);
        //   },
        //   child: Icon(Icons.add),
        //   backgroundColor: primaryColor,
        // ),
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: SafeArea(
              child: NestedScrollView(
                floatHeaderSlivers: true,
                physics: NeverScrollableScrollPhysics(),
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      centerTitle: true,
                      backgroundColor: whiteColor,
                      foregroundColor: primaryColor,
                      title: Text(
                        'Appointment',
                        style: TextStyle(
                            fontSize: 18,
                            color: primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                      pinned: true,
                      floating: true,
                      snap: true,
                      shadowColor: primaryColor,
                      bottom: TabBar(
                        tabs: <Tab>[
                          Tab(
                            child: Text(
                              "Pending\nAppointment",
                              // 'Pending\nAppointment',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Upcoming\nAppointment",
                              style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Tab(
                            child: Text(
                              "Complete\nAppointment",
                              style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                        controller: _tabController,
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    // Tab 1 //
                    // pendingAppointment.length != 0
                    // TODO: add _refreshIndicator
                    // ?
                    Container(
                      child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          // var primaryColor = Palette.green;
                          // if (pendingAppointment[index].appointmentStatus!.toUpperCase() ==
                          //     getTranslated(context, appointment_pending).toString()) {
                          //   primaryColor = primaryColor.withOpacity(0.6);
                          // } else if (pendingAppointment[index].appointmentStatus!.toUpperCase() ==
                          //     getTranslated(context, appointment_cancel).toString()) {
                          //   primaryColor = Palette.red;
                          // } else if (pendingAppointment[index].appointmentStatus!.toUpperCase() ==
                          //     getTranslated(context, appointment_approve).toString()) {
                          //   primaryColor = Palette.green;
                          // }
                          return
                              // pendingAppointment.length != 0
                              //     ?
                              Column(
                            children: [
                              Container(
                                // margin: EdgeInsets.all(10),
                                width: width * 1,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  elevation: 1,
                                  color: whiteColor,
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: width * 0.02,
                                            left: width * 0.03,
                                            right: width * 0.03),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    "Booking ID : ",
                                                    style: TextStyle(
                                                        fontSize: width * 0.035,
                                                        color: primaryColor,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Text(
                                                  "SUM-555", // Booking ID
                                                  style: TextStyle(
                                                      fontSize: width * 0.035,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              child: Text(
                                                "Pending"
                                                    .toUpperCase(), // Appointment status
                                                style: TextStyle(
                                                    fontSize: width * 0.035,
                                                    color: primaryColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: width * 0.02,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: width * 0.15,
                                              margin: EdgeInsets.only(
                                                  left: width * 0.028),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: width * 0.15,
                                                    height: height * 0.07,
                                                    decoration:
                                                        new BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      boxShadow: [
                                                        new BoxShadow(
                                                          color: primaryColor,
                                                          blurRadius: 1.0,
                                                        ),
                                                      ],
                                                    ),
                                                    //TODO: change to cached network image
                                                    child: Image(
                                                      image: AssetImage(
                                                          "assets/images/no_image.jpg"),
                                                    ),
                                                    // CachedNetworkImage(
                                                    //   alignment:
                                                    //       Alignment.center,
                                                    //   imageUrl:
                                                    //       "", // doctor image
                                                    //   imageBuilder: (context,
                                                    //           imageProvider) =>
                                                    //       CircleAvatar(
                                                    //     radius: 50,
                                                    //     backgroundColor:
                                                    //         whiteColor,
                                                    //     child: CircleAvatar(
                                                    //       radius: 25,
                                                    //       backgroundImage:
                                                    //           imageProvider,
                                                    //     ),
                                                    //   ),
                                                    //   placeholder: (context,
                                                    //           url) =>
                                                    //       SpinKitFadingCircle(
                                                    //           color:
                                                    //               primaryColor),
                                                    //   errorWidget: (context,
                                                    //           url, error) =>
                                                    //       Image.asset(
                                                    //           "assets/images/no_image.jpg"),
                                                    // ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: width * 0.6,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    alignment:
                                                        AlignmentDirectional
                                                            .topStart,
                                                    margin: EdgeInsets.only(
                                                      left: width * 0.02,
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Yannick DonOne", // Doctor name
                                                          style: TextStyle(
                                                            fontSize:
                                                                width * 0.04,
                                                            color: primaryColor,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        AlignmentDirectional
                                                            .topStart,
                                                    margin: EdgeInsets.only(
                                                        left: width * 0.02,
                                                        right: width * 0.02,
                                                        top: width * 0.005),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Malaria", // Treatment name
                                                          style: TextStyle(
                                                              fontSize:
                                                                  width * 0.03,
                                                              color: grey),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        AlignmentDirectional
                                                            .topStart,
                                                    margin: EdgeInsets.only(
                                                        left: width * 0.02,
                                                        right: width * 0.02,
                                                        top: width * 0.005),
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "Summit Tech Hospital",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  width * 0.03,
                                                              color: grey),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Column(
                                                children: [
                                                  PopupMenuButton(
                                                    itemBuilder: (context) => [
                                                      PopupMenuItem(
                                                        child: Text(
                                                          "Cancel Appointment",
                                                          style: TextStyle(
                                                            fontSize:
                                                                width * 0.04,
                                                            color: primaryColor,
                                                          ),
                                                        ),
                                                        value: 1,
                                                      )
                                                    ],
                                                    onSelected:
                                                        (dynamic values) {
                                                      if (values == 1) {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) {
                                                            return StatefulBuilder(
                                                              builder: (context,
                                                                  setState) {
                                                                return AlertDialog(
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              20),
                                                                  title: Text(
                                                                    "Why you cancel an Appointment?"
                                                                        .toString(),
                                                                  ),
                                                                  content:
                                                                      Container(
                                                                    height: 250,
                                                                    width: 280,
                                                                    child: ListView
                                                                        .builder(
                                                                      itemCount:
                                                                          cancelReason
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              index) {
                                                                        return Text(
                                                                            'Cancel reason');
                                                                        // return RadioListTile(
                                                                        //   value: index,
                                                                        //   groupValue: value,
                                                                        //   onChanged: (int? reason) {
                                                                        //     setState(() {
                                                                        //       value = reason!.toInt();
                                                                        //     });
                                                                        //   },
                                                                        //   title: Text(cancelReason[index]),
                                                                        // );
                                                                      },
                                                                    ),
                                                                  ),
                                                                  actions: <
                                                                      Widget>[
                                                                    OutlinedButton(
                                                                      child:
                                                                          Text(
                                                                        "No",
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        setState(
                                                                          () {
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                        );
                                                                      },
                                                                    ),
                                                                    OutlinedButton(
                                                                      child:
                                                                          Text(
                                                                        "Yes",
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        // setState(
                                                                        //   () {
                                                                        //     id = pendingAppointment[index].id;
                                                                        //     reason = cancelReason[value];
                                                                        //     Navigator.of(context).pop();
                                                                        //     callApiCancelAppointment();
                                                                        //   },
                                                                        // );
                                                                      },
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          },
                                                        );
                                                      }
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: width * 0.03),
                                        child: Column(
                                          children: [
                                            Divider(
                                              height: width * 0.004,
                                              color: grey,
                                              thickness: width * 0.001,
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 15),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    "Date &\n Time",
                                                    style: TextStyle(
                                                      fontSize: width * 0.03,
                                                      color: grey,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "Patient Name",
                                                    style: TextStyle(
                                                      fontSize: width * 0.03,
                                                      color: grey,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    DateTime.now().toString(),
                                                    style: TextStyle(
                                                        fontSize: width * 0.03,
                                                        color: primaryColor),
                                                  ),
                                                ),
                                                Container(
                                                  child: Text(
                                                    "Summit Tech",
                                                    style: TextStyle(
                                                        fontSize: width * 0.03,
                                                        color: primaryColor),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                          // : Center(
                          //     child: Text(
                          //       "Appointment Not available",
                          //       style: TextStyle(
                          //         fontSize: 16,
                          //         fontWeight: FontWeight.bold,
                          //         color: grey,
                          //       ),
                          //     ),
                          //   );
                        },
                      ),
                    ),
                    // : Container(
                    //     height: height * 0.9,
                    //     child: Center(
                    //       child: Text(
                    //         "Appointment Not available",
                    //         style: TextStyle(
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.bold,
                    //           color: grey,
                    //         ),
                    //       ),
                    //     ),
                    //   ),

                    // Tab 2 //
                    // upcomingAppointment.length != 0
                    // ? RefreshIndicator(
                    //     onRefresh: callApi,
                    //     child: Container(
                    //       child: ListView.builder(
                    //         physics: AlwaysScrollableScrollPhysics(),
                    //         shrinkWrap: true,
                    //         itemCount: upcomingAppointment.length,
                    //         itemBuilder: (context, index) {
                    //           var primaryColor = Palette.green;
                    //           if (upcomingAppointment[index].appointmentStatus!.toUpperCase() ==
                    //               getTranslated(context, appointment_pending).toString()) {
                    //             primaryColor = primaryColor.withOpacity(0.6);
                    //           } else if (upcomingAppointment[index].appointmentStatus!.toUpperCase() ==
                    //               getTranslated(context, appointment_cancel).toString()) {
                    //             primaryColor = Palette.red;
                    //           } else if (upcomingAppointment[index].appointmentStatus!.toUpperCase() ==
                    //               getTranslated(context, appointment_approve).toString()) {
                    //             primaryColor = Palette.green;
                    //           }
                    //           return upcomingAppointment.length != 0
                    //               ? Column(
                    //                   children: [
                    //                     Container(
                    //                       margin: EdgeInsets.all(10),
                    //                       width: width * 1,
                    //                       child: Card(
                    //                         shape: RoundedRectangleBorder(
                    //                           borderRadius: BorderRadius.circular(10.0),
                    //                         ),
                    //                         elevation: 10,
                    //                         color: whiteColor,
                    //                         child: Column(
                    //                           children: [
                    //                             Container(
                    //                               margin: EdgeInsets.only(top: 10, left: width * 0.03, right: width * 0.03),
                    //                               child: Row(
                    //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                                 children: [
                    //                                   Row(
                    //                                     mainAxisAlignment: MainAxisAlignment.start,
                    //                                     children: [
                    //                                       Container(
                    //                                         child: Text(
                    //                                           getTranslated(context, appointment_bookingID).toString(),
                    //                                           style: TextStyle(
                    //                                               fontSize: width * 0.035,
                    //                                               color: primaryColor,
                    //                                               fontWeight: FontWeight.bold),
                    //                                         ),
                    //                                       ),
                    //                                       Text(
                    //                                         upcomingAppointment[index].appointmentId!,
                    //                                         style: TextStyle(
                    //                                             fontSize: width * 0.035,
                    //                                             color: Palette.black,
                    //                                             fontWeight: FontWeight.bold),
                    //                                       ),
                    //                                     ],
                    //                                   ),
                    //                                   Container(
                    //                                     child: Text(
                    //                                       upcomingAppointment[index].appointmentStatus!.toUpperCase(),
                    //                                       style: TextStyle(
                    //                                           fontSize: width * 0.035, color: primaryColor, fontWeight: FontWeight.bold),
                    //                                     ),
                    //                                   ),
                    //                                 ],
                    //                               ),
                    //                             ),
                    //                             Container(
                    //                               margin: EdgeInsets.only(
                    //                                 top: width * 0.02,
                    //                               ),
                    //                               child: Row(
                    //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                                 children: [
                    //                                   Container(
                    //                                     width: width * 0.15,
                    //                                     margin: EdgeInsets.only(left: width * 0.028, right: width * 0.028),
                    //                                     child: Column(
                    //                                       children: [
                    //                                         Container(
                    //                                           width: width * 0.15,
                    //                                           height: height * 0.07,
                    //                                           decoration: new BoxDecoration(
                    //                                             shape: BoxShape.circle,
                    //                                             boxShadow: [
                    //                                               new BoxShadow(
                    //                                                 color: primaryColor,
                    //                                                 blurRadius: 1.0,
                    //                                               ),
                    //                                             ],
                    //                                           ),
                    //                                           child: CachedNetworkImage(
                    //                                             alignment: Alignment.center,
                    //                                             imageUrl: upcomingAppointment[index].doctor!.fullImage!,
                    //                                             imageBuilder: (context, imageProvider) => CircleAvatar(
                    //                                               radius: 50,
                    //                                               backgroundColor: whiteColor,
                    //                                               child: CircleAvatar(
                    //                                                 radius: 25,
                    //                                                 backgroundImage: imageProvider,
                    //                                               ),
                    //                                             ),
                    //                                             placeholder: (context, url) => SpinKitFadingCircle(color: primaryColor),
                    //                                             errorWidget: (context, url, error) =>
                    //                                                 Image.asset("assets/images/no_image.jpg"),
                    //                                           ),
                    //                                         )
                    //                                       ],
                    //                                     ),
                    //                                   ),
                    //                                   Container(
                    //                                     width: width * 0.6,
                    //                                     child: Column(
                    //                                       children: [
                    //                                         Container(
                    //                                           alignment: AlignmentDirectional.topStart,
                    //                                           margin: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                    //                                           child: Column(
                    //                                             children: [
                    //                                               Text(
                    //                                                 upcomingAppointment[index].doctor!.name!,
                    //                                                 style: TextStyle(
                    //                                                   fontSize: width * 0.04,
                    //                                                   color: primaryColor,
                    //                                                 ),
                    //                                                 overflow: TextOverflow.ellipsis,
                    //                                               )
                    //                                             ],
                    //                                           ),
                    //                                         ),
                    //                                         Container(
                    //                                           alignment: AlignmentDirectional.topStart,
                    //                                           margin: EdgeInsets.only(
                    //                                               left: width * 0.02, right: width * 0.02, top: width * 0.005),
                    //                                           child: Column(
                    //                                             children: [
                    //                                               Text(
                    //                                                 upcomingAppointment[index].doctor!.treatment!.name!,
                    //                                                 style: TextStyle(fontSize: width * 0.028, color: grey),
                    //                                                 overflow: TextOverflow.ellipsis,
                    //                                               )
                    //                                             ],
                    //                                           ),
                    //                                         ),
                    //                                         Container(
                    //                                           alignment: AlignmentDirectional.topStart,
                    //                                           margin: EdgeInsets.only(
                    //                                               left: width * 0.02, right: width * 0.02, top: width * 0.005),
                    //                                           child: Column(
                    //                                             children: [
                    //                                               Text(
                    //                                                 upcomingAppointment[index].doctor!.hospital!.address!,
                    //                                                 style: TextStyle(fontSize: width * 0.03, color: grey),
                    //                                                 overflow: TextOverflow.ellipsis,
                    //                                               )
                    //                                             ],
                    //                                           ),
                    //                                         ),
                    //                                       ],
                    //                                     ),
                    //                                   ),
                    //                                   Container(
                    //                                     child: Column(
                    //                                       children: [
                    //                                         PopupMenuButton(
                    //                                           itemBuilder: (context) => [
                    //                                             PopupMenuItem(
                    //                                               child: Text(
                    //                                                 getTranslated(context, appointment_cancelAppointment).toString(),
                    //                                                 style: TextStyle(
                    //                                                   fontSize: width * 0.04,
                    //                                                   color: primaryColor,
                    //                                                 ),
                    //                                               ),
                    //                                               value: 1,
                    //                                             )
                    //                                           ],
                    //                                           onSelected: (dynamic values) {
                    //                                             if (values == 1) {
                    //                                               showDialog(
                    //                                                 context: context,
                    //                                                 builder: (context) {
                    //                                                   return StatefulBuilder(
                    //                                                     builder: (context, setState) {
                    //                                                       return AlertDialog(
                    //                                                         insetPadding: EdgeInsets.all(20),
                    //                                                         title: Text(
                    //                                                           getTranslated(context, appointment_whyCancelAppointment)
                    //                                                               .toString(),
                    //                                                         ),
                    //                                                         content: Container(
                    //                                                           height: 250,
                    //                                                           width: 280,
                    //                                                           child: ListView.builder(
                    //                                                             itemCount: cancelReason.length,
                    //                                                             itemBuilder: (context, index) {
                    //                                                               return RadioListTile(
                    //                                                                 value: index,
                    //                                                                 groupValue: value,
                    //                                                                 onChanged: (int? reason) {
                    //                                                                   setState(() {
                    //                                                                     value = reason!.toInt();
                    //                                                                   });
                    //                                                                 },
                    //                                                                 title: Text(cancelReason[index]),
                    //                                                               );
                    //                                                             },
                    //                                                           ),
                    //                                                         ),
                    //                                                         actions: <Widget>[
                    //                                                           OutlinedButton(
                    //                                                             child: Text(
                    //                                                               getTranslated(context, bookAppointment_no).toString(),
                    //                                                             ),
                    //                                                             onPressed: () {
                    //                                                               setState(
                    //                                                                 () {
                    //                                                                   Navigator.of(context).pop();
                    //                                                                 },
                    //                                                               );
                    //                                                             },
                    //                                                           ),
                    //                                                           OutlinedButton(
                    //                                                             child: Text(
                    //                                                               getTranslated(context, bookAppointment_yes).toString(),
                    //                                                             ),
                    //                                                             onPressed: () {
                    //                                                               setState(
                    //                                                                 () {
                    //                                                                   id = upcomingAppointment[index].id;
                    //                                                                   reason = cancelReason[value];
                    //                                                                   Navigator.of(context).pop();
                    //                                                                   callApiCancelAppointment();
                    //                                                                 },
                    //                                                               );
                    //                                                             },
                    //                                                           ),
                    //                                                         ],
                    //                                                       );
                    //                                                     },
                    //                                                   );
                    //                                                 },
                    //                                               );
                    //                                             }
                    //                                           },
                    //                                         )
                    //                                       ],
                    //                                     ),
                    //                                   ),
                    //                                 ],
                    //                               ),
                    //                             ),
                    //                             Container(
                    //                               margin: EdgeInsets.only(top: width * 0.03),
                    //                               child: Column(
                    //                                 children: [
                    //                                   Divider(
                    //                                     height: width * 0.004,
                    //                                     color: Palette.dark_grey,
                    //                                     thickness: width * 0.001,
                    //                                   )
                    //                                 ],
                    //                               ),
                    //                             ),
                    //                             Container(
                    //                               margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    //                               child: Column(
                    //                                 children: [
                    //                                   Row(
                    //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                                     children: [
                    //                                       Container(
                    //                                         child: Text(
                    //                                           getTranslated(context, appointment_dateTime).toString(),
                    //                                           style: TextStyle(
                    //                                             fontSize: width * 0.03,
                    //                                             color: grey,
                    //                                           ),
                    //                                         ),
                    //                                       ),
                    //                                       Container(
                    //                                         child: Text(
                    //                                           getTranslated(context, appointment_patientName).toString(),
                    //                                           style: TextStyle(
                    //                                             fontSize: width * 0.03,
                    //                                             color: grey,
                    //                                           ),
                    //                                         ),
                    //                                       ),
                    //                                     ],
                    //                                   ),
                    //                                   Row(
                    //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                                     children: [
                    //                                       Container(
                    //                                         child: Text(
                    //                                           upcomingAppointment[index].date! + '  ' + upcomingAppointment[index].time!,
                    //                                           style: TextStyle(fontSize: width * 0.03, color: primaryColor),
                    //                                         ),
                    //                                       ),
                    //                                       Container(
                    //                                         child: Text(
                    //                                           upcomingAppointment[index].patientName!,
                    //                                           style: TextStyle(fontSize: width * 0.03, color: primaryColor),
                    //                                           overflow: TextOverflow.ellipsis,
                    //                                         ),
                    //                                       ),
                    //                                     ],
                    //                                   ),
                    //                                 ],
                    //                               ),
                    //                             )
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 )
                    //               : Center(
                    //                   child: Text(
                    //                     getTranslated(context, appointment_appointmentNotAvailable).toString(),
                    //                     style: TextStyle(
                    //                       fontSize: 16,
                    //                       fontWeight: FontWeight.bold,
                    //                       color: primaryColor,
                    //                     ),
                    //                   ),
                    //                 );
                    //         },
                    //       ),
                    //     ),
                    //   )
                    // :
                    Container(
                      height: height * 0.9,
                      child: Center(
                        child: Text(
                          "Appointment Not available",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: grey,
                          ),
                        ),
                      ),
                    ),

                    // Tab 3 //
                    // pastAppointment.length != 0
                    //     ? RefreshIndicator(
                    //         onRefresh: callApi,
                    //         child: Container(
                    //           child: ListView.builder(
                    //             physics: AlwaysScrollableScrollPhysics(),
                    //             shrinkWrap: true,
                    //             itemCount: pastAppointment.length,
                    //             itemBuilder: (context, index) {
                    //               var primaryColor = Palette.green;
                    //               if (pastAppointment[index].appointmentStatus!.toUpperCase() ==
                    //                   getTranslated(context, appointment_pending).toString()) {
                    //                 primaryColor = primaryColor.withOpacity(0.6);
                    //               } else if (pastAppointment[index].appointmentStatus!.toUpperCase() ==
                    //                   getTranslated(context, appointment_cancel).toString()) {
                    //                 primaryColor = Palette.red;
                    //               } else if (pastAppointment[index].appointmentStatus!.toUpperCase() ==
                    //                   getTranslated(context, appointment_approve).toString()) {
                    //                 primaryColor = Palette.green;
                    //               }
                    //               return Column(
                    //                 children: [
                    //                   GestureDetector(
                    //                     onTap: () {
                    //                       Navigator.push(
                    //                         context,
                    //                         MaterialPageRoute(
                    //                           builder: (context) => Myprescription(
                    //                             doctorImage: pastAppointment[index].doctor!.fullImage,
                    //                             doctorName: pastAppointment[index].doctor!.name,
                    //                             doctorTreatmentName: pastAppointment[index].doctor!.treatment!.name,
                    //                             doctorAddress: 'Rajkot',
                    //                             appointmentDate: pastAppointment[index].date,
                    //                             appointmentTime: pastAppointment[index].time,
                    //                             patientName: pastAppointment[index].patientName,
                    //                             appointmentIdPrescription:
                    //                                 pastAppointment[index].prescription == true ? pastAppointment[index].id : 0,
                    //                             appointmentId: pastAppointment[index].id,
                    //                             userRating: pastAppointment[index].rate,
                    //                           ),
                    //                         ),
                    //                       );
                    //                     },
                    //                     child: Container(
                    //                       margin: EdgeInsets.all(10),
                    //                       width: width * 1,
                    //                       // height: 170,
                    //                       child: Card(
                    //                         shape: RoundedRectangleBorder(
                    //                           borderRadius: BorderRadius.circular(10.0),
                    //                         ),
                    //                         elevation: 10,
                    //                         color: whiteColor,
                    //                         child: Column(
                    //                           children: [
                    //                             Container(
                    //                               margin: EdgeInsets.only(top: width * 0.02, left: width * 0.04, right: width * 0.04),
                    //                               child: Row(
                    //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                                 children: [
                    //                                   Row(
                    //                                     mainAxisAlignment: MainAxisAlignment.start,
                    //                                     children: [
                    //                                       Container(
                    //                                         child: Text(
                    //                                           getTranslated(context, appointment_bookingID).toString(),
                    //                                           style: TextStyle(
                    //                                               fontSize: width * 0.035, color: primaryColor, fontWeight: FontWeight.bold),
                    //                                         ),
                    //                                       ),
                    //                                       Text(
                    //                                         pastAppointment[index].appointmentId!,
                    //                                         style: TextStyle(
                    //                                             fontSize: width * 0.035, color: Palette.black, fontWeight: FontWeight.bold),
                    //                                       ),
                    //                                     ],
                    //                                   ),
                    //                                   Row(
                    //                                     mainAxisAlignment: MainAxisAlignment.start,
                    //                                     children: [
                    //                                       Container(
                    //                                         child: Text(
                    //                                           pastAppointment[index].appointmentStatus!.toUpperCase(),
                    //                                           style: TextStyle(
                    //                                               fontSize: width * 0.035, color: primaryColor, fontWeight: FontWeight.bold),
                    //                                         ),
                    //                                       ),
                    //                                     ],
                    //                                   ),
                    //                                 ],
                    //                               ),
                    //                             ),
                    //                             Container(
                    //                               margin: EdgeInsets.only(
                    //                                 top: width * 0.02,
                    //                               ),
                    //                               child: Row(
                    //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                                 children: [
                    //                                   Container(
                    //                                     width: width * 0.15,
                    //                                     margin: EdgeInsets.only(left: width * 0.028, right: width * 0.028),
                    //                                     child: Column(
                    //                                       children: [
                    //                                         Container(
                    //                                           width: width * 0.15,
                    //                                           height: height * 0.07,
                    //                                           decoration: new BoxDecoration(
                    //                                             shape: BoxShape.circle,
                    //                                             boxShadow: [
                    //                                               new BoxShadow(
                    //                                                 color: primaryColor,
                    //                                                 blurRadius: 1.0,
                    //                                               ),
                    //                                             ],
                    //                                           ),
                    //                                           child: CachedNetworkImage(
                    //                                             alignment: Alignment.center,
                    //                                             imageUrl: pastAppointment[index].doctor!.fullImage!,
                    //                                             imageBuilder: (context, imageProvider) => CircleAvatar(
                    //                                               radius: 50,
                    //                                               backgroundColor: whiteColor,
                    //                                               child: CircleAvatar(
                    //                                                 radius: 25,
                    //                                                 backgroundImage: imageProvider,
                    //                                               ),
                    //                                             ),
                    //                                             placeholder: (context, url) => SpinKitFadingCircle(color: primaryColor),
                    //                                             errorWidget: (context, url, error) =>
                    //                                                 Image.asset("assets/images/no_image.jpg"),
                    //                                           ),
                    //                                         )
                    //                                       ],
                    //                                     ),
                    //                                   ),
                    //                                   Container(
                    //                                     width: width * 0.72,
                    //                                     child: Column(
                    //                                       children: [
                    //                                         Container(
                    //                                           alignment: AlignmentDirectional.topStart,
                    //                                           margin: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                    //                                           child: Column(
                    //                                             children: [
                    //                                               Text(
                    //                                                 pastAppointment[index].doctor!.name!,
                    //                                                 style: TextStyle(fontSize: width * 0.04, color: primaryColor),
                    //                                                 overflow: TextOverflow.ellipsis,
                    //                                               )
                    //                                             ],
                    //                                           ),
                    //                                         ),
                    //                                         Container(
                    //                                           alignment: AlignmentDirectional.topStart,
                    //                                           margin: EdgeInsets.only(
                    //                                               left: width * 0.02, right: width * 0.02, top: width * 0.005),
                    //                                           child: Column(
                    //                                             children: [
                    //                                               Text(
                    //                                                 pastAppointment[index].doctor!.treatment!.name!,
                    //                                                 style: TextStyle(fontSize: width * 0.028, color: grey),
                    //                                                 overflow: TextOverflow.ellipsis,
                    //                                               )
                    //                                             ],
                    //                                           ),
                    //                                         ),
                    //                                         Container(
                    //                                           alignment: AlignmentDirectional.topStart,
                    //                                           margin: EdgeInsets.only(
                    //                                               left: width * 0.02, right: width * 0.02, top: width * 0.005),
                    //                                           child: Column(
                    //                                             children: [
                    //                                               Text(
                    //                                                 pastAppointment[index].doctor!.hospital!.address!,
                    //                                                 style: TextStyle(fontSize: width * 0.03, color: grey),
                    //                                                 overflow: TextOverflow.ellipsis,
                    //                                               )
                    //                                             ],
                    //                                           ),
                    //                                         ),
                    //                                       ],
                    //                                     ),
                    //                                   ),
                    //                                 ],
                    //                               ),
                    //                             ),
                    //                             Container(
                    //                               margin: EdgeInsets.only(top: width * 0.03),
                    //                               child: Column(
                    //                                 children: [
                    //                                   Divider(
                    //                                     height: width * 0.004,
                    //                                     color: Palette.dark_grey,
                    //                                     thickness: width * 0.001,
                    //                                   )
                    //                                 ],
                    //                               ),
                    //                             ),
                    //                             Container(
                    //                               margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    //                               child: Column(
                    //                                 children: [
                    //                                   Row(
                    //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                                     children: [
                    //                                       Container(
                    //                                         child: Text(
                    //                                           getTranslated(context, appointment_dateTime).toString(),
                    //                                           style: TextStyle(fontSize: width * 0.03, color: grey),
                    //                                         ),
                    //                                       ),
                    //                                       Container(
                    //                                         child: Text(
                    //                                           getTranslated(context, appointment_patientName).toString(),
                    //                                           // 'Patient Name',
                    //                                           style: TextStyle(fontSize: width * 0.03, color: grey),
                    //                                         ),
                    //                                       ),
                    //                                     ],
                    //                                   ),
                    //                                   Row(
                    //                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                                     children: [
                    //                                       Container(
                    //                                         child: Text(
                    //                                           pastAppointment[index].date! + '  ' + pastAppointment[index].time!,
                    //                                           style: TextStyle(fontSize: width * 0.03, color: primaryColor),
                    //                                         ),
                    //                                       ),
                    //                                       Container(
                    //                                         child: Text(
                    //                                           pastAppointment[index].patientName!,
                    //                                           style: TextStyle(fontSize: width * 0.03, color: primaryColor),
                    //                                           overflow: TextOverflow.ellipsis,
                    //                                         ),
                    //                                       ),
                    //                                     ],
                    //                                   ),
                    //                                 ],
                    //                               ),
                    //                             )
                    //                           ],
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //                 ],
                    //               );
                    //             },
                    //           ),
                    //         ),
                    //       )
                    //     :
                    Container(
                      height: height * 0.9,
                      child: Center(
                        child: Text(
                          "Appointment Not available",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
