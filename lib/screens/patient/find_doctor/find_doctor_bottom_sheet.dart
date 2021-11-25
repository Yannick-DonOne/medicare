import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:medicare/screens/patient/find_doctor/text.dart';
import 'package:medicare/utils/theme/theme.dart';

import 'doctor_list.dart';

List<DropdownMenuItem<Object?>> _dropdownTestItems = [];

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

Future<dynamic> findDoctorSheet(
    BuildContext context,
    Size size,
    ValueNotifier<String> currentSpecialist,
    ValueNotifier<String> currentRegion,
    ValueNotifier<String> currentGender) {
  return showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: Column(
                  children: [
                    Text(
                      'Find Doctor',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 50,
                      child: Divider(
                        height: 1,
                        thickness: 3,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              ValueListenableBuilder<String>(
                valueListenable: currentSpecialist,
                builder: (BuildContext context, String value, Widget? child) {
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
                height: size.height * 0.04,
              ),
              ValueListenableBuilder<String>(
                valueListenable: currentRegion,
                builder: (BuildContext context, String value, Widget? child) {
                  return DropdownBelow(
                    value: value,
                    itemWidth: size.width,
                    itemTextstyle: TextStyle(
                      color: black.withOpacity(0.6),
                      fontSize: size.width * 0.055,
                      fontWeight: FontWeight.w700,
                    ),
                    boxTextstyle: TextStyle(
                      color: black.withOpacity(0.6),
                      fontSize: size.width * 0.055,
                      fontWeight: FontWeight.w700,
                    ),
                    hint: Text(regionsList[0]),
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
                        buildDropdownTestItems(regionsList),
                    onChanged: (value) {
                      currentRegion.value = value.toString();
                    },
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Container(
                width: size.width,
                height: size.height * 0.09,
                decoration: BoxDecoration(
                  color: whiteColor,
                  border: Border.all(
                    color: grey.withOpacity(0.8),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(
                          color: black.withOpacity(0.6),
                          fontSize: size.width * 0.055,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              ValueListenableBuilder<String>(
                valueListenable: currentGender,
                builder: (BuildContext context, String value, Widget? child) {
                  return DropdownBelow(
                    value: value,
                    itemWidth: size.width,
                    itemTextstyle: TextStyle(
                      color: black.withOpacity(0.6),
                      fontSize: size.width * 0.055,
                      fontWeight: FontWeight.w700,
                    ),
                    hint: Text(genderList[0]),
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
                        buildDropdownTestItems(genderList),
                    onChanged: (value) {
                      currentGender.value = value.toString();
                    },
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Align(
                child: Container(
                  width: size.width * 0.6,
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, DoctorList.id);
                      },
                      child: Text(
                        'Search',
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
