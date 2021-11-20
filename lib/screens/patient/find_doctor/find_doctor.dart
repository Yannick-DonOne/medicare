import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';

class FindDoctor extends StatelessWidget {
  const FindDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColorScreen,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          'Specialist Doctor',
                          style: TextStyle(
                            color: black.withOpacity(0.6),
                            fontSize: size.width * 0.055,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: black.withOpacity(0.6),
                          size: size.width * 0.13,
                        ),
                      ],
                    ),
                  ),
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
                          'Current Location',
                          style: TextStyle(
                            color: black.withOpacity(0.6),
                            fontSize: size.width * 0.055,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: black.withOpacity(0.6),
                          size: size.width * 0.13,
                        ),
                      ],
                    ),
                  ),
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
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: black.withOpacity(0.6),
                          size: size.width * 0.13,
                        ),
                      ],
                    ),
                  ),
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
                          'Gender',
                          style: TextStyle(
                            color: black.withOpacity(0.6),
                            fontSize: size.width * 0.055,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: black.withOpacity(0.6),
                          size: size.width * 0.13,
                        ),
                      ],
                    ),
                  ),
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
                      child: Text(
                        'Search',
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
