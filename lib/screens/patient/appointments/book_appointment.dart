import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicare/utils/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SingingCharacter { Paypal, Razorpay, Stripe, FlutterWave, PayStack, COD }

class PatientBookappointment extends StatefulWidget {
  static String id = 'book_appointment';

  @override
  _PatientBookappointmentState createState() => _PatientBookappointmentState();
}

class _PatientBookappointmentState extends State<PatientBookappointment> {
  bool isPaymentClicked = false;
  String? paymentToken = "";

  List<String> reportImages = [];

  // Detail_Setting & Payment_Detail //
  String? businessname = "";
  String? logo = "";
  int? cod = 0;
  int? stripe = 0;
  int? paypal = 0;
  int? razor = 0;
  int? flutterwave = 0;
  int? paystack = 0;

  String? userphoneno = "";
  String? useremail = "";
  String? username = "";

  // Payment count //
  SingingCharacter? _character;
  int? selectedRadio;
  late var str;
  var parts;
  var paymenttype;

  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;

  String? selectTime = "";

  String? name = "Summit Tech";
  String? expertise = "";
  String? appointmentFees = "XAF 5000";
  dynamic newAppointmentFees = 0.0;
  String? experience = "";
  dynamic rate = 0;
  String? desc = "";
  String education = "";
  String certificate = "";
  String? fullImage = "";
  String? treatmentname = "";
  String? hospitalName = "";
  String? hospitalAddress = "";

  List hosiptal = [];
  List hosiptalGallery = [];

  TextEditingController appointmentFor = TextEditingController();
  TextEditingController patientName = TextEditingController();
  TextEditingController illnessInformation = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController patientAddress = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController drugEffect = TextEditingController();
  TextEditingController note = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController paymentStatus = TextEditingController();

  TextEditingController offer = TextEditingController();

  String reportImage = "";
  String reportImage1 = "";
  String reportImage2 = "";
  File? proImage;
  File? proImage1;
  File? proImage2;

  List timelist = [];

  DateTime? _selectedDate;
  DateTime? _firstTimeSelected;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> step1 = GlobalKey<FormState>();
  final GlobalKey<FormState> step2 = GlobalKey<FormState>();

  final GlobalKey<FormState> _offerFormKey = GlobalKey<FormState>();

  List<String> AppointmentFor = [];
  String? selectAppointmentfor;

  List<String> drugeEfects = [];
  String? selectDrugeffects;

  int? id = 0;
  String newDate = "";
  String newDateuser = "";

  String passBookDate = "";
  String passBookTime = "";
  String passBookID = "";

  String? bookingId = "";

  //Discount //
  String discountType = "";
  int? isFlat = 0;
  int? flatDiscount = 0;
  int? discount = 0;
  int? minDiscount = 0;
  DateTime? todayDate;
  double prAmount = 0;

  _BookappointmentState(int? id) {
    this.id = id;
  }

  _pass_DateTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(
      () {
        passBookDate = '$newDateuser';
        passBookTime = '$selectTime';
        passBookID = '$bookingId';
        prefs.setString('BookDate', passBookDate);
        prefs.setString('BookTime', passBookTime);
        prefs.setString('BookID', passBookID);
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio = 0;

    Future.delayed(Duration.zero, () {
      AppointmentFor = ["My Self".toString(), "Patient".toString()];
      drugeEfects = ["Yes".toString(), "No".toString()];
    });

    var temp = '$_firstTimeSelected';

    date.text = newDateuser;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  // RazorPay Clear //
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width;
    double height;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(width * 0.3, size.height * 0.2),
          child: SafeArea(
            top: true,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
                  color: transparentColor,
                  child: Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(
                        right: width * 0.02, left: width * 0.02),
                    child: GestureDetector(
                      child: Icon(Icons.arrow_back_ios),
                      onTap: () {
                        if (_currentStep == 0) Navigator.pop(context);
                        if (_currentStep == 1) cancel();
                        if (_currentStep == 2) cancel();
                        // if (_currentStep == 3) cancel();
                      },
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: width * 0.04, right: width * 0.04),
                  child: Row(
                    children: [
                      Container(
                        child: Column(
                          children: [
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
                                    SpinKitPulse(color: primaryColor),
                                errorWidget: (context, url, error) =>
                                    Image.asset("assets/images/no_image.jpg"),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: width * 0.6,
                        margin: EdgeInsets.only(
                            left: width * 0.04, right: width * 0.04),
                        child: Column(
                          children: [
                            Container(
                              alignment: AlignmentDirectional.topStart,
                              child: Column(
                                children: [
                                  Text(
                                    'Summit Tech', // hospitalName
                                    style: TextStyle(
                                        fontSize: width * 0.047,
                                        color: primaryColor),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              alignment: AlignmentDirectional.topStart,
                              margin: EdgeInsets.only(top: width * 0.01),
                              child: Column(
                                children: [
                                  Text(
                                    'Yannick DonOne', //name
                                    style: TextStyle(
                                        fontSize: width * 0.038, color: grey),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: width * 0.01),
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/location1.svg',
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.5,
                                    alignment: AlignmentDirectional.topStart,
                                    margin: EdgeInsets.only(
                                        top: width * 0.01,
                                        left: width * 0.02,
                                        right: width * 0.02),
                                    child: Column(
                                      children: [
                                        Text(
                                          'Bonduma Gate', // hospitalAddress
                                          style: TextStyle(
                                            fontSize: width * 0.03,
                                            color: grey,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: width * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "Appointment Fees: ".toString(),
                          style: TextStyle(
                              fontSize: width * 0.045, color: primaryColor),
                        ),
                      ),
                      Container(
                        child: Text(
                          'XAF 5000', // appointmentFees
                          style:
                              TextStyle(fontSize: width * 0.04, color: black),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        body: Container(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Expanded(
                  child: Stepper(
                    type: stepperType,
                    physics: ScrollPhysics(),
                    onStepCancel: null,
                    currentStep: _currentStep,
                    onStepTapped: (step) => tapped(step),
                    onStepContinue: continued,
                    steps: <Step>[
                      // Step 1 //
                      Step(
                        title: new Text(
                          "Patient /\n MySelf".toString(),
                        ),
                        content: Form(
                          key: step1,
                          child: SingleChildScrollView(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: width * 0.03),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Appointment For?".toString(),
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  DropdownButtonFormField(
                                    hint: Text(
                                      "My Self".toString() +
                                          ' / ' +
                                          "Patient".toString(),
                                      style: TextStyle(
                                        fontSize: width * 0.035,
                                        color: grey,
                                      ),
                                    ),
                                    value: selectAppointmentfor,
                                    isExpanded: true,
                                    iconSize: 30,
                                    onSaved: (dynamic value) {
                                      setState(() {
                                        selectAppointmentfor = value;
                                      });
                                    },
                                    onChanged: (dynamic newValue) {
                                      setState(
                                        () {
                                          selectAppointmentfor = newValue;
                                        },
                                      );
                                    },
                                    validator: (dynamic value) => value == null
                                        ? "Please select appointment".toString()
                                        : null,
                                    items: AppointmentFor.map((location) {
                                      return DropdownMenuItem<String>(
                                        child: new Text(
                                          location,
                                          style: TextStyle(
                                            fontSize: width * 0.04,
                                            color: primaryColor,
                                          ),
                                        ),
                                        value: location,
                                      );
                                    }).toList(),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: width * 0.05),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Patient Name".toString(),
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    textCapitalization:
                                        TextCapitalization.words,
                                    controller: patientName,
                                    keyboardType: TextInputType.text,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[a-zA-Z ]'))
                                    ],
                                    style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: primaryColor,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Enter patient name".toString(),
                                      // 'Enter patient name',
                                      hintStyle: TextStyle(
                                        fontSize: width * 0.04,
                                        color: grey,
                                      ),
                                    ),
                                    validator: (String? value) {
                                      value!.trim();
                                      if (value.isEmpty) {
                                        return "Please enter patient name"
                                            .toString();
                                        // "Please enter patient name";
                                      } else if (value.trim().length < 1) {
                                        return "Please enter patient valid name"
                                            .toString();
                                        // "Please enter patient valid name";
                                      }
                                      return null;
                                    },
                                    onChanged: (String name) {
                                      name.trim();
                                    },
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: width * 0.05),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Any Illness".toString(),
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    textCapitalization:
                                        TextCapitalization.words,
                                    controller: illnessInformation,
                                    keyboardType: TextInputType.text,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[a-zA-Z0-9 ]'))
                                    ],
                                    style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: primaryColor,
                                    ),
                                    decoration: InputDecoration(
                                      hintText:
                                          "Enter patient illness".toString(),
                                      // 'Enter patient illness',
                                      hintStyle: TextStyle(
                                        fontSize: width * 0.04,
                                        color: grey,
                                      ),
                                    ),
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return "Please enter patient illness"
                                            .toString();
                                        // "Please enter patient illness";
                                      } else if (value.trim().length < 1) {
                                        return "Please enter valid illness"
                                            .toString();
                                      }
                                      return null;
                                    },
                                    onSaved: (String? name) {},
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: width * 0.05),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Age".toString(),
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    controller: age,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[a-zA-Z0-9]'))
                                    ],
                                    style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: primaryColor,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: "Enter patient age".toString(),
                                      // 'Enter patient age',
                                      hintStyle: TextStyle(
                                        fontSize: width * 0.04,
                                        color: grey,
                                      ),
                                    ),
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return "Please enter patient age"
                                            .toString();
                                      }
                                      return null;
                                    },
                                    onSaved: (String? name) {},
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: width * 0.05),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Patient Address".toString(),
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    controller: patientAddress,
                                    keyboardType: TextInputType.text,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[a-zA-Z0-9, ]'))
                                    ],
                                    style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: primaryColor,
                                    ),
                                    decoration: InputDecoration(
                                      hintText:
                                          "Enter patient address".toString(),
                                      hintStyle: TextStyle(
                                        fontSize: width * 0.04,
                                        color: grey,
                                      ),
                                    ),
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return "Please enter patient address"
                                            .toString();
                                      } else if (value.trim().length < 1) {
                                        return "Please enter valid Address"
                                            .toString();
                                      }
                                      return null;
                                    },
                                    onSaved: (String? name) {},
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: width * 0.05),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Phone Number".toString(),
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    controller: phoneNo,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[0-9]')),
                                      LengthLimitingTextInputFormatter(9)
                                    ],
                                    style: TextStyle(
                                      fontSize: width * 0.035,
                                      color: primaryColor,
                                    ),
                                    decoration: InputDecoration(
                                      hintText:
                                          "Enter patient/patient relative phone no."
                                              .toString(),
                                      hintStyle: TextStyle(
                                        fontSize: width * 0.04,
                                        color: grey,
                                      ),
                                    ),
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return "Please enter phone number"
                                            .toString();
                                      }
                                      if (value.length != 9) {
                                        return "Please enter valid number"
                                            .toString();
                                      }
                                      return null;
                                    },
                                    onSaved: (String? name) {},
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: width * 0.05),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Any side effects of the drug?"
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: width * 0.038,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  DropdownButtonFormField(
                                    hint: Text(
                                      "Yes / No".toString(),
                                      style: TextStyle(
                                        fontSize: width * 0.04,
                                        color: grey,
                                      ),
                                    ),
                                    value: selectDrugeffects,
                                    isExpanded: true,
                                    iconSize: 30,
                                    onSaved: (dynamic value) {
                                      setState(() {
                                        selectDrugeffects = value;
                                      });
                                    },
                                    onChanged: (dynamic newValue) {
                                      setState(
                                        () {
                                          selectDrugeffects = newValue;
                                        },
                                      );
                                    },
                                    validator: (dynamic value) => value == null
                                        ? "Please select drug any effect"
                                            .toString()
                                        : null,
                                    items: drugeEfects.map((location) {
                                      return DropdownMenuItem<String>(
                                        child: new Text(
                                          location,
                                          style: TextStyle(
                                            fontSize: width * 0.04,
                                            color: primaryColor,
                                          ),
                                        ),
                                        value: location,
                                      );
                                    }).toList(),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: width * 0.05),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Note".toString(),
                                          style: TextStyle(
                                              fontSize: width * 0.038,
                                              color: primaryColor,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ),
                                  TextFormField(
                                    textCapitalization:
                                        TextCapitalization.sentences,
                                    controller: note,
                                    keyboardType: TextInputType.text,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp('[a-zA-Z0-9,. ]'))
                                    ],
                                    maxLength: 40,
                                    style: TextStyle(
                                      fontSize: width * 0.04,
                                      color: primaryColor,
                                    ),
                                    decoration: InputDecoration(
                                      hintText:
                                          "Any problem in describe".toString(),
                                      hintStyle: TextStyle(
                                        fontSize: width * 0.04,
                                        color: grey,
                                      ),
                                    ),
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return "Please enter illness describe"
                                            .toString();
                                      } else if (value.trim().length < 1) {
                                        return "Please enter valid notes"
                                            .toString();
                                      }
                                      return null;
                                    },
                                    onSaved: (String? name) {},
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: width * 0.05),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Upload Patient Report Image"
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: width * 0.04,
                                              color: primaryColor),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              alignment: Alignment.topLeft,
                                              margin: EdgeInsets.only(
                                                  top: width * 0.028,
                                                  left: width * 0.02,
                                                  right: width * 0.02),
                                              child: Container(
                                                height: width * 0.24,
                                                width: width * 0.24,
                                                child: Card(
                                                  color: black,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: proImage != null
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            // _ChooseProfileImage();
                                                          },
                                                          child: Image.file(
                                                            proImage!,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        )
                                                      : Container(
                                                          height: width * 0.24,
                                                          width: width * 0.24,
                                                          child:
                                                              CachedNetworkImage(
                                                            height:
                                                                width * 0.24,
                                                            width: width * 0.24,
                                                            alignment: Alignment
                                                                .center,
                                                            imageUrl:
                                                                reportImage,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                            placeholder: (context,
                                                                    url) =>
                                                                // CircularProgressIndicator(),
                                                                SpinKitFadingCircle(
                                                                    color:
                                                                        primaryColor),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    IconButton(
                                                              icon: Icon(
                                                                Icons
                                                                    .add_outlined,
                                                                size: 50,
                                                                color:
                                                                    primaryColor,
                                                              ),
                                                              onPressed: () {
                                                                // _ChooseProfileImage();
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: width * 0.028,
                                                  left: width * 0.02,
                                                  right: width * 0.02),
                                              child: Container(
                                                height: width * 0.24,
                                                width: width * 0.24,
                                                child: Card(
                                                  color: black,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: proImage1 != null
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            // _ChooseProfileImage1();
                                                          },
                                                          child: Image.file(
                                                            proImage1!,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        )
                                                      : Container(
                                                          height: width * 0.24,
                                                          width: width * 0.24,
                                                          child:
                                                              CachedNetworkImage(
                                                            height:
                                                                width * 0.24,
                                                            width: width * 0.24,
                                                            alignment: Alignment
                                                                .center,
                                                            imageUrl:
                                                                reportImage1,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                            placeholder: (context,
                                                                    url) =>
                                                                SpinKitFadingCircle(
                                                                    color:
                                                                        primaryColor),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    IconButton(
                                                              icon: Icon(
                                                                Icons
                                                                    .add_outlined,
                                                                size: 50,
                                                                color:
                                                                    primaryColor,
                                                              ),
                                                              onPressed: () {
                                                                // _ChooseProfileImage1();
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              alignment: Alignment.topLeft,
                                              margin: EdgeInsets.only(
                                                  top: width * 0.028,
                                                  left: width * 0.02,
                                                  right: width * 0.02),
                                              child: Container(
                                                height: width * 0.24,
                                                width: width * 0.24,
                                                child: Card(
                                                  color: black,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: proImage2 != null
                                                      ? GestureDetector(
                                                          onTap: () {
                                                            // _ChooseProfileImage2();
                                                          },
                                                          child: Image.file(
                                                            proImage2!,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        )
                                                      : Container(
                                                          height: width * 0.24,
                                                          width: width * 0.24,
                                                          child:
                                                              CachedNetworkImage(
                                                            height:
                                                                width * 0.24,
                                                            width: width * 0.24,
                                                            alignment: Alignment
                                                                .center,
                                                            imageUrl:
                                                                reportImage2,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                            placeholder: (context,
                                                                    url) =>
                                                                SpinKitFadingCircle(
                                                                    color:
                                                                        primaryColor),
                                                            errorWidget:
                                                                (context, url,
                                                                        error) =>
                                                                    IconButton(
                                                              icon: Icon(
                                                                Icons
                                                                    .add_outlined,
                                                                size: 50,
                                                                color:
                                                                    primaryColor,
                                                              ),
                                                              onPressed: () {
                                                                // _ChooseProfileImage2();
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 0
                            ? StepState.complete
                            : StepState.disabled,
                      ),

                      // Step 2 //
                      Step(
                        title: new Text(
                          "Date &\n Time".toString(),
                        ),
                        content: Form(
                          key: step2,
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  alignment: AlignmentDirectional.center,
                                  margin: EdgeInsets.only(top: width * 0.01),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Select Appointment Date".toString(),
                                        style: TextStyle(
                                            fontSize: width * 0.04,
                                            color: primaryColor),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: width * 0.1,
                                  width: width * 1,
                                  margin: EdgeInsets.only(top: width * 0.02),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 5),
                                  decoration: BoxDecoration(
                                      color: black,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: TextFormField(
                                      // focusNode: AlwaysDisabledFocusNode(),
                                      controller: date,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Select Date".toString(),
                                        hintStyle: TextStyle(
                                            fontSize: width * 0.038,
                                            color: primaryColor),
                                      ),
                                      onTap: () {
                                        _selectDate(context);
                                      },
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return "Please Select Any Date"
                                              .toString();
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                // // if(date.text != null)
                                Container(
                                    child:
                                        // 0 < timelist.length
                                        //     ?
                                        Column(
                                  children: [
                                    Container(
                                      alignment: AlignmentDirectional.center,
                                      margin:
                                          EdgeInsets.only(top: width * 0.05),
                                      child: Column(
                                        children: [
                                          Text(
                                            "Select Appointment Time"
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: width * 0.04,
                                                color: primaryColor),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: width * 0.04),
                                      child: GridView.builder(
                                        itemCount: timelist.length,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 5,
                                          crossAxisCount: 3,
                                          childAspectRatio: 2.2,
                                        ),
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    selectTime = timelist[index]
                                                        .startTime;
                                                  });
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width: width * 0.3,
                                                  child: Card(
                                                    color: selectTime ==
                                                            timelist[index]
                                                                .startTime
                                                        ? primaryColor
                                                        : black,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  12),
                                                          child: Text(
                                                            timelist[index]
                                                                .startTime!,
                                                            style: TextStyle(
                                                                color: selectTime ==
                                                                        timelist[index]
                                                                            .startTime
                                                                    ? whiteColor
                                                                    : primaryColor),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                )
                                    // : Container(
                                    //     height: height * 0.4,
                                    //     width:
                                    //         MediaQuery.of(context).size.width,
                                    //     child: Center(
                                    //       child: Text(
                                    //         "Doctor Not Available \n Please Select Other Date"
                                    //             .toString(),
                                    //         textAlign: TextAlign.center,
                                    //         style: TextStyle(
                                    //             fontSize: width * 0.04,
                                    //             color: grey),
                                    //       ),
                                    //     ),
                                    //   ),
                                    ),
                              ],
                            ),
                          ),
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 1
                            ? StepState.complete
                            : StepState.disabled,
                      ),

                      // Step 3 //
                      Step(
                        title: new Text(
                          "Doctor".toString(),
                        ),
                        content: GestureDetector(
                          onTap: () {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          },
                          child: Container(
                            height: height / 1.5,
                            width: MediaQuery.of(context).size.width,
                            child: ListView(
                              shrinkWrap: false,
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                Form(
                                  key: _offerFormKey,
                                  child: Container(
                                    height: height * 0.1,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: width * 0.5,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10,
                                              vertical: width * 0.03),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 2),
                                          decoration: BoxDecoration(
                                              color: whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: TextFormField(
                                            controller: offer,
                                            keyboardType: TextInputType.text,
                                            textCapitalization:
                                                TextCapitalization.words,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp('[a-zA-Z0-9]'))
                                            ],
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Offer Code".toString(),
                                              hintStyle: TextStyle(
                                                fontSize: width * 0.04,
                                                color: grey,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return "Please Enter Code"
                                                    .toString();
                                              }
                                              return null;
                                            },
                                            onSaved: (String? name) {},
                                          ),
                                        ),
                                        Container(
                                          width: width * 0.3,
                                          height: height * 0.05,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5,
                                              vertical: width * 0.03),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 2),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (_offerFormKey.currentState!
                                                  .validate()) {
                                                // CallApiApplyOffer();
                                              }
                                            },
                                            child: Text(
                                              "Apply".toString(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    paypal == 1
                                        ? Container(
                                            margin: EdgeInsets.all(5),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        grey.withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 7,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: whiteColor),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.08,
                                            child:
                                                RadioListTile<SingingCharacter>(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              title: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                child: Row(
                                                  children: [
                                                    Image.network(
                                                      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/PayPal_Logo_Icon_2014.svg/1200px-PayPal_Logo_Icon_2014.svg.png",
                                                      height: 30,
                                                      width: 50,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.01,
                                                    ),
                                                    Text(
                                                      'PayPal',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: black),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              value: SingingCharacter.Paypal,
                                              activeColor: black,
                                              groupValue: _character,
                                              onChanged:
                                                  (SingingCharacter? value) {
                                                setState(() {
                                                  _character = value;
                                                  isPaymentClicked = true;
                                                });
                                              },
                                            ),
                                          )
                                        : Container(),
                                    razor == 1
                                        ? Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        grey.withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 7,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: whiteColor),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.08,
                                            // width: MediaQuery.of(context).size.width / 2.2,
                                            child:
                                                RadioListTile<SingingCharacter>(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              // contentPadding: EdgeInsets.only(left: 10),
                                              title: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                child: Row(
                                                  children: [
                                                    Image.network(
                                                      "https://avatars.githubusercontent.com/u/7713209?s=280&v=4",
                                                      height: 30,
                                                      width: 50,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.01,
                                                    ),
                                                    Text('RazorPay',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: black)),
                                                  ],
                                                ),
                                              ),
                                              value: SingingCharacter.Razorpay,
                                              activeColor: black,
                                              groupValue: _character,
                                              onChanged:
                                                  (SingingCharacter? value) {
                                                setState(
                                                  () {
                                                    _character = value;
                                                    isPaymentClicked = true;
                                                  },
                                                );
                                              },
                                            ),
                                          )
                                        : Container(),
                                    stripe == 1
                                        ? Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        grey.withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 7,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: whiteColor),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.08,
                                            // width: MediaQuery.of(context).size.width / 2.2,
                                            child:
                                                RadioListTile<SingingCharacter>(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              // contentPadding: EdgeInsets.only(left: 10),
                                              title: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                child: Row(
                                                  children: [
                                                    Image.network(
                                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT3PGzfbaZZzR0j8rOWBjWJPGWnkPzkm12f5A&usqp=CAU",
                                                      height: 30,
                                                      width: 50,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.01,
                                                    ),
                                                    Text('Stripe',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: black)),
                                                  ],
                                                ),
                                              ),
                                              value: SingingCharacter.Stripe,
                                              activeColor: black,
                                              groupValue: _character,
                                              onChanged:
                                                  (SingingCharacter? value) {
                                                setState(() {
                                                  _character = value;
                                                  isPaymentClicked = true;
                                                });
                                              },
                                            ))
                                        : Container(),
                                    flutterwave == 1
                                        ? Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        grey.withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 7,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: whiteColor),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.08,
                                            // width: MediaQuery.of(context).size.width / 2.2,
                                            child:
                                                RadioListTile<SingingCharacter>(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              // contentPadding: EdgeInsets.only(left: 10),
                                              title: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                // color: Colors.red,
                                                child: Row(
                                                  children: [
                                                    Image.network(
                                                      "https://cdn.filestackcontent.com/OITnhSPCSzOuiVvwnH7r",
                                                      height: 30,
                                                      width: 50,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.01,
                                                    ),
                                                    Flexible(
                                                      child: Text('Flutterwave',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: black)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              value:
                                                  SingingCharacter.FlutterWave,
                                              activeColor: black,
                                              groupValue: _character,
                                              onChanged:
                                                  (SingingCharacter? value) {
                                                setState(() {
                                                  _character = value;
                                                  isPaymentClicked = true;
                                                });
                                              },
                                            ))
                                        : Container(),
                                    paystack == 1
                                        ? Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        grey.withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 7,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: whiteColor),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.08,
                                            // width: MediaQuery.of(context).size.width / 2.2,
                                            child:
                                                RadioListTile<SingingCharacter>(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              // contentPadding: EdgeInsets.only(left: 10),
                                              title: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                child: Row(
                                                  children: [
                                                    Image.network(
                                                      "https://website-v3-assets.s3.amazonaws.com/assets/img/hero/Paystack-mark-white-twitter.png",
                                                      height: 30,
                                                      width: 50,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.01,
                                                    ),
                                                    Text('Paystack',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: black)),
                                                  ],
                                                ),
                                              ),
                                              value: SingingCharacter.PayStack,
                                              activeColor: black,
                                              groupValue: _character,
                                              onChanged:
                                                  (SingingCharacter? value) {
                                                setState(() {
                                                  _character = value;
                                                  isPaymentClicked = true;
                                                });
                                              },
                                            ),
                                          )
                                        : Container(),
                                    cod == 1
                                        ? Container(
                                            alignment: Alignment.center,
                                            margin: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color:
                                                        grey.withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 7,
                                                    offset: Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: whiteColor),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.08,
                                            // width: MediaQuery.of(context).size.width / 2.2,
                                            child:
                                                RadioListTile<SingingCharacter>(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              // contentPadding: EdgeInsets.only(left: 10),
                                              title: Text(
                                                'COD (Case On Delivery)',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize: 16, color: black),
                                              ),
                                              value: SingingCharacter.COD,
                                              activeColor: black,
                                              groupValue: _character,
                                              onChanged:
                                                  (SingingCharacter? value) {
                                                setState(() {
                                                  _character = value;
                                                  isPaymentClicked = true;
                                                });
                                              },
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 2
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                    ],
                    // controlsBuilder: (BuildContext context,
                    //     {VoidCallback? onStepContinue,
                    //     VoidCallback? onStepCancel}) {
                    //   return Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: <Widget>[
                    //       SizedBox(),
                    //       SizedBox(),
                    //     ],
                    //   );
                    // },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          child: ElevatedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_currentStep == 0)
                  Text(
                    "Continue".toString(),
                    style: TextStyle(fontSize: width * 0.04, color: whiteColor),
                  ),
                if (_currentStep == 1)
                  Text(
                    "Continue".toString(),
                    style: TextStyle(fontSize: width * 0.04, color: whiteColor),
                  ),
                if (_currentStep == 2)
                  '$newAppointmentFees' == "0.0"
                      ? Text(
                          "Pay".toString().toString() + '$appointmentFees',
                          style: TextStyle(
                              fontSize: width * 0.04, color: whiteColor),
                        )
                      : Text(
                          "Pay".toString() + '$newAppointmentFees',
                          style: TextStyle(
                              fontSize: width * 0.04, color: whiteColor),
                        )
              ],
            ),
            onPressed: () {
              setState(
                () {
                  if (_currentStep == 0 && step1.currentState!.validate()) {
                    continued();
                  } else if (_currentStep == 1 &&
                      date != null &&
                      selectTime != null &&
                      selectTime != "" &&
                      selectTime != "null") {
                    continued();
                  } else if (_currentStep == 2) {
                    str = "$_character";
                    parts = str.split(".");
                    paymenttype = parts.sublist(1).join('.').trim();
                    continued();
                    if (_character!.index == 0) {
                      print('Paypal');
                    } else if (_character!.index == 1) {
                      print('Razorpay');
                    } else if (_character!.index == 2) {
                      print('Stripe');
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => StripePaymentScreen(
                      //       selectAppointmentFor: Select_Appointmentfor,
                      //       patientName: patient_name.text,
                      //       illnessInformation: illness_information.text,
                      //       age: age.text,
                      //       patientAddress: patient_address.text,
                      //       phoneNo: phone_no.text,
                      //       selectDrugEffects: Select_Drugeffects,
                      //       note: note.text,
                      //       newDate: New_Date,
                      //       selectTime: selectTime,
                      //       appointmentFees: "$newAppointmentFees" != "0.0"
                      //           ? '$newAppointmentFees'
                      //           : '$appointmentFees',
                      //       doctorId: id,
                      //       newDateUser: New_Dateuser,
                      //       reportImages: reportImages,
                      //     ),
                      //   ),
                      // );

                    } else if (_character!.index == 3) {
                      // beginPayment();
                      print('FlutterWave');
                    } else if (_character!.index == 4) {
                      print('PayStack');
                      // payStackFunction();
                    } else if (_character!.index == 5) {
                      print('cod');
                      setState(() {
                        // CallApiBook();
                      });
                    }
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  // Select Date Method //
  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate != null ? _selectedDate! : DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 366)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.light(
              primary: primaryColor,
              onPrimary: whiteColor,
              surface: primaryColor,
              onSurface: black,
            ),
            dialogBackgroundColor: whiteColor,
          ),
          child: child!,
        );
      },
    );
    if (newSelectedDate != null) {
      print(newSelectedDate);
      setState(() {
        _selectedDate = newSelectedDate;
        print('New date $newSelectedDate');
        print('selectedDate date $_selectedDate');
      });

      // date
      //   // ..text = DateFormat('dd-MM-yyyy').format(_selectedDate!)
      //   ..selection = TextSelection.fromPosition(
      //     TextPosition(
      //         offset: date.text.length, affinity: TextAffinity.upstream),
      //   );
      // var temp = '$_selectedDate';
      // // Date Formate  dispaly user
      // New_Dateuser = DateUtil().formattedDate(DateTime.parse(temp));
      // // Date Formate pass Api
      // New_Date = DateUtilforpass().formattedDate(DateTime.parse(temp));
    }
    // TimeSlot();
  }

//   // Image Function //
//   void _ChooseProfileImage() {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext bc) {
//         return SafeArea(
//           child: Container(
//             child: new Wrap(
//               children: <Widget>[
//                 new ListTile(
//                     leading: new Icon(Icons.photo_library),
//                     title: new Text(
//                       getTranslated(context, fromGallery).toString(),
//                     ),
//                     onTap: () {
//                       _ProimgFromGallery();
//                       Navigator.of(context).pop();
//                     }),
//                 new ListTile(
//                   leading: new Icon(Icons.photo_camera),
//                   title: new Text(
//                     getTranslated(context, fromCamera).toString(),
//                   ),
//                   onTap: () {
//                     _ProimgFromCamera();
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _ChooseProfileImage1() {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext bc) {
//         return SafeArea(
//           child: Container(
//             child: new Wrap(
//               children: <Widget>[
//                 new ListTile(
//                     leading: new Icon(Icons.photo_library),
//                     title: new Text(
//                       getTranslated(context, fromGallery).toString(),
//                     ),
//                     onTap: () {
//                       _ProimgFromGallery1();
//                       Navigator.of(context).pop();
//                     }),
//                 new ListTile(
//                   leading: new Icon(Icons.photo_camera),
//                   title: new Text(
//                     getTranslated(context, fromCamera).toString(),
//                   ),
//                   onTap: () {
//                     _ProimgFromCamera1();
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _ChooseProfileImage2() {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext bc) {
//         return SafeArea(
//           child: Container(
//             child: new Wrap(
//               children: <Widget>[
//                 new ListTile(
//                     leading: new Icon(Icons.photo_library),
//                     title: new Text(
//                       getTranslated(context, fromGallery).toString(),
//                     ),
//                     onTap: () {
//                       _ProimgFromGallery2();
//                       Navigator.of(context).pop();
//                     }),
//                 new ListTile(
//                   leading: new Icon(Icons.photo_camera),
//                   title: new Text(
//                     getTranslated(context, fromCamera).toString(),
//                   ),
//                   onTap: () {
//                     _ProimgFromCamera2();
//                     Navigator.of(context).pop();
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
}
