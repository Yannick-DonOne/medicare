import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicare/utils/theme/theme.dart';

class PatientDoctorDetails extends StatefulWidget {
  static String id = 'patient_doctor_details';
  final String doctor;

  const PatientDoctorDetails(this.doctor);
  @override
  _PatientDoctorDetailsState createState() => _PatientDoctorDetailsState();
}

class _PatientDoctorDetailsState extends State<PatientDoctorDetails>
    with TickerProviderStateMixin {
  bool _loadding = false;

  TabController? _tabController;

  int? id = 0;
  String? name = "";
  String? expertise = "";
  String? appointmentFees = "";
  String? experience = "";
  dynamic rate = 0.0;
  String? desc = "";
  String education = "";
  String certificate = "";
  String? fullImage = "";
  String? treatmentname = "";

  String? mobileNo = "";

  List<String?> degree = [];
  List<String?> collage = [];
  List<String?> de_year = [];

  List<String?> award = [];
  List<String?> ce_year = [];

  List hosiptaldetail = [];
  List hosiptalGallery = [];

  List reviews = [];

  _DoctordetailState(int? id) {
    this.id = id;
  }

  void initState() {
    // Future.delayed(Duration.zero, () {
    //   tabList.add(
    //     new Tab(
    //       child: Text(
    //         "Doctor\nInformation",
    //         textAlign: TextAlign.center,
    //       ),
    //     ),
    //   );
    //   tabList.add(
    //     new Tab(
    //       child: Text(
    //         "Hospital\nInformation".toString(),
    //         textAlign: TextAlign.center,
    //       ),
    //     ),
    //   );
    //   tabList.add(
    //     new Tab(
    //       child: Text(
    //         "Doctor\nReview".toString(),
    //         textAlign: TextAlign.center,
    //       ),
    //     ),
    //   );
    //   _tabController = new TabController(vsync: this, length: 3);
    //   // _doctordetail();
    // });

    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width;
    double height;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: primaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          backgroundColor: whiteColor,
          title: Text(
            "Doctor Detail",
            style: TextStyle(
                fontSize: 18, color: primaryColor, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: height * 0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // launch("tel:$mobileNo");
                              },
                              child: Container(
                                child: SvgPicture.asset(
                                  'assets/icons/call.svg',
                                ),
                              ),
                            ),
                            Container(
                              width: width * 0.2,
                              height: width * 0.2,
                              child: CachedNetworkImage(
                                alignment: Alignment.center,
                                imageUrl: '$fullImage',
                                imageBuilder: (context, imageProvider) =>
                                    CircleAvatar(
                                  radius: 50,
                                  backgroundColor: primaryColor,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: imageProvider,
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    // CircularProgressIndicator(),
                                    SpinKitFadingCircle(color: primaryColor),
                                errorWidget: (context, url, error) =>
                                    Image.asset("assets/images/no_image.jpg"),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // launch("sms:$mobileNo");
                              },
                              child: Container(
                                child: SvgPicture.asset(
                                  'assets/icons/msg.svg',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: width * 0.03),
                        child: Text(
                          'Yannick DonOne', // Doctor name
                          style: TextStyle(
                            fontSize: width * 0.05,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: width * 0.01),
                        child: Text(
                          'Malaria', // treatmentname
                          style: TextStyle(
                            fontSize: width * 0.04,
                            color: grey,
                          ),
                        ),
                      ),
                      Container(
                        // height: 150,
                        // margin: EdgeInsets.only(top: height * 0.04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: width * 0.005),
                                  child: Text(
                                    "Appointment Fees",
                                    style: TextStyle(
                                        fontSize: width * 0.035,
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "XAF".toString() +
                                        '5000', // appointmentFees
                                    style: TextStyle(
                                      fontSize: width * 0.035,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: width * 0.005),
                                  child: Text(
                                    "Doctor Experience",
                                    style: TextStyle(
                                        fontSize: width * 0.035,
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '12  ' + "Year",
                                    style: TextStyle(
                                      fontSize: width * 0.035,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: width * 0.005),
                                    child: Text(
                                      "Doctor Rates",
                                      style: TextStyle(
                                          fontSize: width * 0.035,
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/hart.svg',
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: width * 0.028,
                                            right: width * 0.028),
                                        child: Text(
                                          '5',
                                          style: TextStyle(
                                            fontSize: width * 0.035,
                                          ),
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
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          // height: size.height * 0.05,
                          color: Colors.white10,
                          child: TabBar(
                            labelColor: primaryColor,
                            controller: _tabController,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicatorColor: Colors.transparent,
                            tabs: [
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                physics: AlwaysScrollableScrollPhysics(),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Container(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: Text(
                                          "Personal Bio",
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              color: primaryColor),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: Text(
                                          "Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut  Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut ",
                                          style: TextStyle(
                                              fontSize: 13, color: grey),
                                          textAlign: TextAlign.justify,
                                          maxLines: 4,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: Text(
                                          "Education",
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              color: primaryColor),
                                        ),
                                      ),
                                    ),
                                    ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: 2,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: Column(
                                            children: [
                                              Container(
                                                alignment: AlignmentDirectional
                                                    .topStart,
                                                child: Text(
                                                  "Masters".toUpperCase(),
                                                  style: TextStyle(
                                                      fontSize: width * 0.03,
                                                      color: primaryColor),
                                                ),
                                              ),
                                              Container(
                                                alignment: AlignmentDirectional
                                                    .topStart,
                                                child: Text(
                                                  "University of Buea" + '.',
                                                  style: TextStyle(
                                                      fontSize: width * 0.03,
                                                      color: grey),
                                                ),
                                              ),
                                              Container(
                                                alignment: AlignmentDirectional
                                                    .topStart,
                                                child: Text(
                                                  "2001",
                                                  style: TextStyle(
                                                    fontSize: width * 0.03,
                                                    color: grey,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                    Center(
                                      child: Container(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: Text(
                                          "Certificate",
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              color: primaryColor),
                                        ),
                                      ),
                                    ),
                                    ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: 2,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'Best Doctor',
                                                    style: TextStyle(
                                                        fontSize: width * 0.03,
                                                        color: primaryColor),
                                                  ),
                                                ),
                                                Text(
                                                  '.  ' + "2021",
                                                  style: TextStyle(
                                                      fontSize: width * 0.03,
                                                      color: grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    Center(
                                      child: Container(
                                        alignment:
                                            AlignmentDirectional.topStart,
                                        child: Text(
                                          "Specialization",
                                          // "Specialization",
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              color: primaryColor),
                                        ),
                                      ),
                                    ),
                                    Center(
                                        child: Container(
                                      alignment: AlignmentDirectional.topStart,
                                      child: Text(
                                        'Expertise',
                                        style: TextStyle(
                                            fontSize: width * 0.03,
                                            color: grey),
                                      ),
                                    )),
                                  ],
                                ),
                              ),

                              // tab 2
                              SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  physics: AlwaysScrollableScrollPhysics(),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Container(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: width * 0.35,
                                                child: Text(
                                                  "Hospital Name",
                                                  style: TextStyle(
                                                      fontSize: width * 0.04,
                                                      color: primaryColor),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  "hosiptaldetail[index].name!",
                                                  style: TextStyle(
                                                      fontSize: width * 0.03,
                                                      color: grey),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: width * 0.35,
                                                child: Text(
                                                  "Phone Number",
                                                  style: TextStyle(
                                                      fontSize: width * 0.04,
                                                      color: primaryColor),
                                                ),
                                              ),
                                              Container(
                                                child: Text(
                                                  "hosiptaldetail[index].phone!",
                                                  style: TextStyle(
                                                      fontSize: width * 0.03,
                                                      color: grey),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: width * 0.35,
                                                child: Text(
                                                  "Address",
                                                  style: TextStyle(
                                                      fontSize: width * 0.04,
                                                      color: primaryColor),
                                                  maxLines: 2,
                                                ),
                                              ),
                                              Container(
                                                width: width * 0.55,
                                                child: Text(
                                                  "hosiptaldetail[index].address!",
                                                  style: TextStyle(
                                                      fontSize: width * 0.03,
                                                      color: grey),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: Row(
                                            children: [
                                              Container(
                                                width: width * 0.35,
                                                child: Text(
                                                  "Facility",
                                                  style: TextStyle(
                                                      fontSize: width * 0.04,
                                                      color: primaryColor),
                                                ),
                                              ),
                                              Container(
                                                width: width / 3,
                                                child: Text(
                                                  "hosiptaldetail[index].facility!",
                                                  style: TextStyle(
                                                      fontSize: width * 0.03,
                                                      color: grey),
                                                  maxLines: 4,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),

                              // tab 3
                              // reviews.length != 0
                              // ?
                              SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  physics: AlwaysScrollableScrollPhysics(),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Container(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: Text(
                                            "Review",
                                            style: TextStyle(
                                                fontSize: width * 0.04,
                                                color: primaryColor),
                                          ),
                                        ),
                                      ),
                                      // reviews.length != 0
                                      //     ?
                                      ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount: 1,
                                        itemBuilder: (context, index) {
                                          // String date = DateUtil().formattedDate(
                                          //     DateTime.parse(
                                          //         reviews[index].createdAt!));
                                          return Container(
                                            width: width * 0.87,
                                            height: height * 0.1,
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                  child: ListTile(
                                                    isThreeLine: true,
                                                    leading: SizedBox(
                                                      child: Container(
                                                        height: height * 0.062,
                                                        width: width * 0.125,
                                                        decoration:
                                                            new BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                boxShadow: [
                                                              new BoxShadow(
                                                                color:
                                                                    primaryColor,
                                                                blurRadius: 1.0,
                                                              ),
                                                            ]),
                                                        child: Image.asset(
                                                            "assets/images/no_image.jpg",
                                                            height: 30,
                                                            width: 30),
                                                        //     CachedNetworkImage(
                                                        //   alignment:
                                                        //       Alignment.center,
                                                        //   imageUrl:
                                                        //       "reviews[index].user!.fullImage!",
                                                        //   imageBuilder: (context,
                                                        //           imageProvider) =>
                                                        //       CircleAvatar(
                                                        //     radius: 50,
                                                        //     backgroundColor:
                                                        //         whiteColor,
                                                        //     child: CircleAvatar(
                                                        //       radius: 20,
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
                                                        //     Image.asset(
                                                        //   "assets/images/no_image.jpg",
                                                        // ),
                                                        // ),
                                                      ),
                                                    ),
                                                    title: Column(
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              AlignmentDirectional
                                                                  .topStart,
                                                          margin:
                                                              EdgeInsets.only(
                                                            top: height * 0.01,
                                                          ),
                                                          child: Text(
                                                            "reviews[index].user!.name!",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    width *
                                                                        0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        Container(
                                                          alignment:
                                                              AlignmentDirectional
                                                                  .topStart,
                                                          child: Text(
                                                            DateTime.now()
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 11,
                                                                color: grey),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    trailing: Container(
                                                      child: RatingBarIndicator(
                                                        rating: 0,
                                                        itemBuilder:
                                                            (context, index) =>
                                                                Icon(
                                                          Icons.star,
                                                          color: primaryColor,
                                                        ),
                                                        itemCount: 1,
                                                        itemSize: width * 0.04,
                                                        direction:
                                                            Axis.horizontal,
                                                      ),
                                                    ),
                                                    subtitle: Container(
                                                      margin: EdgeInsets.only(
                                                          top: width * 0.015),
                                                      alignment:
                                                          AlignmentDirectional
                                                              .topStart,
                                                      child: Text(
                                                        "reviews[index].review!",
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            color: grey),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      )
                                      // : SizedBox(),
                                    ],
                                  )),
                            ],
                            unselectedLabelColor: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: width * 0.12,
          child: ElevatedButton(
            child: Text(
              "Book Appointment",
              style: TextStyle(fontSize: width * 0.04, color: whiteColor),
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              // SharedPreferenceHelper.getBoolean(Preferences.is_logged_in) == true
              //     ? Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => Bookappointment(id),
              //         ),
              //       )
              //     : FormHelper.showMessage(
              //         context,
              //         getTranslated(
              //                 context, doctorDetail_appointmentBook_alert_title)
              //             .toString(),
              //         getTranslated(
              //                 context, doctorDetail_appointmentBook_alert_text)
              //             .toString(),
              //         getTranslated(context, cancel).toString(),
              //         () {
              //           Navigator.of(context).pop();
              //         },
              //         buttonText2: getTranslated(context, login).toString(),
              //         // "Login",
              //         isConfirmationDialog: true,
              //         onPressed2: () {
              //           Navigator.pushNamed(context, 'SignIn');
              //         },
              //       );
            },
          ),
        ),
      ),
    );
  }
}
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: bgColorScreen,
//       appBar: AppBar(
//         backgroundColor: primaryColor,
//       ),
//       body: SafeArea(
//         child: FutureBuilder(
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             // if (!snapshot.hasData) {
//             //   return Center(
//             //     child: CircularProgressIndicator(),
//             //   );
//             // }
//             return NotificationListener<OverscrollIndicatorNotification>(
//               onNotification: (OverscrollIndicatorNotification overscroll) {
//                 overscroll.disallowGlow();
//                 return true;
//               },
//               child: ListView.builder(
//                 // itemCount: snapshot.data.size,
//                 itemCount: 1,
//                 itemBuilder: (context, index) {
//                   // DocumentSnapshot document = snapshot.data.docs[index];
//                   return Container(
//                     margin: EdgeInsets.only(top: 5),
//                     child: Column(
//                       children: <Widget>[
//                         CircleAvatar(
//                           child: Image.asset(
//                             'assets/images/logo.png',
//                             height: 140,
//                             width: 140,
//                             fit: BoxFit.cover,
//                           ),
//                           backgroundColor: transparentColor,
//                           radius: 90,
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Text(
//                           "Summit Tech",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 24,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "Pediatritian",
//                           style: TextStyle(fontSize: 18, color: Colors.black54),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "General Hospital",
//                           style: TextStyle(fontSize: 18, color: Colors.black54),
//                         ),
//                         SizedBox(
//                           height: 16,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // for (var i = 0; i < document['rating']; i++)

//                             for (var i = 0; i < 3; i++)
//                               Icon(
//                                 Icons.star_rounded,
//                                 color: Colors.indigoAccent,
//                                 size: 30,
//                               ),
//                             if (5 - 3 > 0)
//                               for (var i = 0; i < 5 - 3; i++)
//                                 Icon(
//                                   Icons.star_rounded,
//                                   color: Colors.black12,
//                                   size: 30,
//                                 ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 14,
//                         ),
//                         Container(
//                           width: MediaQuery.of(context).size.width,
//                           margin: EdgeInsets.symmetric(horizontal: 10),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(
//                                 width: 15,
//                               ),
//                               Icon(Icons.place_outlined),
//                               SizedBox(
//                                 width: 20,
//                               ),
//                               Container(
//                                 width: MediaQuery.of(context).size.width / 1.4,
//                                 child: Text(
//                                   "Buea, Cameroon",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                             ],
//                           ),
//                         ),
//                         // Container(
//                         //   height: MediaQuery.of(context).size.height / 12,
//                         //   margin: EdgeInsets.symmetric(horizontal: 10),
//                         //   child: Row(
//                         //     children: [
//                         //       SizedBox(
//                         //         width: 15,
//                         //       ),
//                         //       Icon(Icons.phone),
//                         //       SizedBox(
//                         //         width: 11,
//                         //       ),
//                         //       TextButton(
//                         //         onPressed: () =>
//                         //             _launchCaller("tel:" + "document['phone']"),
//                         //         child: Text(
//                         //           "document['phone']".toString(),
//                         //           style: TextStyle(
//                         //               fontSize: 16, color: Colors.blue),
//                         //         ),
//                         //       ),
//                         //       SizedBox(
//                         //         width: 10,
//                         //       ),
//                         //     ],
//                         //   ),
//                         // ),

//                         Container(
//                           margin: EdgeInsets.symmetric(horizontal: 10),
//                           child: Row(
//                             children: [
//                               SizedBox(
//                                 width: 15,
//                               ),
//                               Icon(Icons.access_time_rounded),
//                               SizedBox(
//                                 width: 20,
//                               ),
//                               Text(
//                                 'Working Hours',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 20,
//                         ),
//                         Container(
//                           margin: EdgeInsets.symmetric(horizontal: 10),
//                           padding: EdgeInsets.only(left: 60),
//                           child: Row(
//                             children: [
//                               Text(
//                                 'Today: ',
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 "9:00 am" + " - " + "7:00 pm",
//                                 style: TextStyle(
//                                   fontSize: 17,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 50,
//                         ),
//                         CustomButton(
//                           child: Text('Book an Appointment'),
//                           gradient: CustomTheme.buttonGradient,
//                           onPressed: () {
//                             // TODO: navigate to book appointment screen
//                           },
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
