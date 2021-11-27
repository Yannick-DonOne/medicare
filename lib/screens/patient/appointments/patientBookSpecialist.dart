import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:medicare/screens/patient/find_doctor/doctor_list.dart';
import 'package:medicare/screens/patient/find_doctor/text.dart';
import 'package:medicare/screens/patient/home/doctor_details/doctor_details.dart';
import 'package:medicare/utils/theme/theme.dart';
import 'package:medicare/utils/widgets/custom_button.dart';

class SelectSpecialist extends StatefulWidget {
  static String id = 'select_specialist';
  SelectSpecialist({Key? key}) : super(key: key);

  @override
  _SelectSpecialistState createState() => _SelectSpecialistState();
}

class _SelectSpecialistState extends State<SelectSpecialist> {
  List<DropdownMenuItem<Object?>> _dropdownTestItems = [];
  ValueNotifier<String> currentSpecialist = ValueNotifier(specialistList[0]);
  List<DropdownMenuItem<Object?>> buildDropdownTestItems(List _testList) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in _testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i),
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String userImage =
        'https://cdn4.iconfinder.com/data/icons/people-avatar-flat-1/64/girl_chubby_beautiful_people_woman_lady_avatar-512.png';

    ValueNotifier<bool> isVisible = ValueNotifier(false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Specialists'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ValueListenableBuilder<String>(
                        valueListenable: currentSpecialist,
                        builder: (BuildContext context, String specialist,
                            Widget? child) {
                          return DropdownBelow(
                            value: specialist,
                            itemWidth: size.width,
                            itemTextstyle: TextStyle(
                              color: black.withOpacity(0.6),
                              fontSize: size.width * 0.055,
                              fontWeight: FontWeight.w700,
                            ),
                            hint: Text('Select Specialist'),
                            boxTextstyle: TextStyle(
                              color: black.withOpacity(0.6),
                              fontSize: size.width * 0.055,
                              fontWeight: FontWeight.w700,
                            ),
                            boxDecoration: BoxDecoration(
                              color: whiteColor,
                              border: Border.all(
                                color: grey.withOpacity(0.8),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                            boxPadding: EdgeInsets.symmetric(horizontal: 8.0),
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              color: black.withOpacity(0.6),
                              size: size.width * 0.13,
                            ),
                            boxHeight: size.height * 0.09,
                            boxWidth: size.width,
                            items: _dropdownTestItems =
                                buildDropdownTestItems(specialistList),
                            onChanged: (value) {
                              currentSpecialist.value = value.toString();
                              isVisible.value = true;
                            },
                          );
                        },
                      ),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.pushNamed(context, DoctorList.id);
                      //   },
                      //   child: Container(
                      //     height: 50,
                      //     width: size.width * 0.5,
                      //     decoration: BoxDecoration(
                      //       color: primaryColor,
                      //       borderRadius: BorderRadius.all(
                      //         Radius.circular(5),
                      //       ),
                      //     ),
                      //     child: Center(
                      //       child: Text(
                      //         'Search',
                      //         style: TextStyle(
                      //           fontSize: size.width * 0.06,
                      //           fontWeight: FontWeight.w500,
                      //           color: whiteColor,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ValueListenableBuilder<bool>(
                  valueListenable: isVisible,
                  builder: (context, value, _) {
                    return Visibility(
                      visible: value,
                      child: Expanded(
                        child: ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 5),
                              margin: EdgeInsets.only(
                                bottom: 5.0,
                              ),
                              decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(12.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1.0,
                                      blurRadius: 6.0,
                                    ),
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: size.width * 0.83,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundColor: Color(0xFFD9D9D9),
                                          backgroundImage:
                                              NetworkImage(userImage),
                                          radius: size.width * 0.1,
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            RichText(
                                              text: TextSpan(
                                                text: 'Wellness\n',
                                                style: TextStyle(
                                                  color: Colors.purple,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.3,
                                                ),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text: 'Dr Ayor Kruger',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        '\nPoplar Pharma Limited',
                                                    style: TextStyle(
                                                      color: Colors.black45,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        '\nDermatologist \nSAn Franscisco CA | 5 min',
                                                    style: TextStyle(
                                                      color: Colors.black38,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            CustomButton(
                                              child: Text('View'),
                                              gradient:
                                                  CustomTheme.buttonGradient,
                                              onPressed: () {
                                                // TODO: navigate to doctor detail screen pass doctor info
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PatientDoctorDetails(
                                                            ''),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons
                                        .medical_services, // TODO use heart icon here
                                    color: primaryColor,
                                    size: 25,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }),
              ValueListenableBuilder<bool>(
                  valueListenable: isVisible,
                  builder: (context, value, _) {
                    return (value)
                        ? Container()
                        : Expanded(
                            child: Center(
                              child: Text(
                                "No Specialist Selected",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: grey,
                                ),
                              ),
                            ),
                          );
                  })
            ],
          ),
        ),
      ),
    );
  }
}



// Container(
//           padding: EdgeInsets.all(8.0),
//           child: Center(
//             child: Card(
//               elevation: 2,
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       'Select Specialist',
//                       style: TextStyle(
//                         fontSize: size.width * 0.08,
//                         color: primaryColor,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     ValueListenableBuilder<String>(
//                       valueListenable: currentSpecialist,
//                       builder: (BuildContext context, String specialist,
//                           Widget? child) {
//                         return DropdownBelow(
//                           value: specialist,
//                           itemWidth: size.width,
//                           itemTextstyle: TextStyle(
//                             color: black.withOpacity(0.6),
//                             fontSize: size.width * 0.055,
//                             fontWeight: FontWeight.w700,
//                           ),
//                           hint: Text(specialistList[0]),
//                           boxTextstyle: TextStyle(
//                             color: black.withOpacity(0.6),
//                             fontSize: size.width * 0.055,
//                             fontWeight: FontWeight.w700,
//                           ),
//                           boxDecoration: BoxDecoration(
//                             color: whiteColor,
//                             border: Border.all(
//                               color: grey.withOpacity(0.8),
//                               width: 2,
//                             ),
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(4),
//                             ),
//                           ),
//                           boxPadding: EdgeInsets.symmetric(horizontal: 8.0),
//                           icon: Icon(
//                             Icons.keyboard_arrow_down,
//                             color: black.withOpacity(0.6),
//                             size: size.width * 0.13,
//                           ),
//                           boxHeight: size.height * 0.09,
//                           boxWidth: size.width,
//                           items: _dropdownTestItems =
//                               buildDropdownTestItems(specialistList),
//                           onChanged: (value) {
//                             currentSpecialist.value = value.toString();
//                           },
//                         );
//                       },
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     InkWell(
//                       onTap: () {
//                         Navigator.pushNamed(context, DoctorList.id);
//                       },
//                       child: Container(
//                         height: 50,
//                         width: size.width * 0.5,
//                         decoration: BoxDecoration(
//                           color: primaryColor,
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(5),
//                           ),
//                         ),
//                         child: Center(
//                           child: Text(
//                             'Search',
//                             style: TextStyle(
//                               fontSize: size.width * 0.06,
//                               fontWeight: FontWeight.w500,
//                               color: whiteColor,
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
