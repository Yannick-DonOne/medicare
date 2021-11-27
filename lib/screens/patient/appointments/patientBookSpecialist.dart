import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:medicare/screens/patient/find_doctor/doctor_list.dart';
import 'package:medicare/screens/patient/find_doctor/text.dart';
import 'package:medicare/utils/theme/theme.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Specialist'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Select Specialist',
                      style: TextStyle(
                        fontSize: size.width * 0.08,
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ValueListenableBuilder<String>(
                      valueListenable: currentSpecialist,
                      builder:
                          (BuildContext context, String value, Widget? child) {
                        return DropdownBelow(
                          value: value,
                          itemWidth: size.width,
                          itemTextstyle: TextStyle(
                            color: black.withOpacity(0.6),
                            fontSize: size.width * 0.055,
                            fontWeight: FontWeight.w700,
                          ),
                          hint: Text(specialistList[0]),
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
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, DoctorList.id);
                      },
                      child: Container(
                        height: 50,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Search',
                            style: TextStyle(
                              fontSize: size.width * 0.06,
                              fontWeight: FontWeight.w500,
                              color: whiteColor,
                            ),
                          ),
                        ),
                      ),
                    )
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
