import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';

class AddAppointment extends StatelessWidget {
  static String id = 'add_appointment';
  const AddAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColorScreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chose a convinient time to meet with a specialist',
                style: TextStyle(
                  color: black,
                  fontSize: 23.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: size.height * 0.1,
                  width: size.width * (3 / 4),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: whiteColor,
                          size: size.height * 0.06,
                        ),
                        SizedBox(
                          width: size.width * 0.05,
                        ),
                        Text(
                          'Add to calendar',
                          style: TextStyle(
                            color: whiteColor,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Image(
                    image: const AssetImage('assets/images/doctor.png'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
