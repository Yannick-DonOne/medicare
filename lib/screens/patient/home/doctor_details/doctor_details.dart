import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medicare/utils/theme/theme.dart';
import 'package:medicare/utils/widgets/custom_button.dart';

class PatientDoctorDetails extends StatefulWidget {
  static String id = 'patient_doctor_details';
  final String doctor;

  const PatientDoctorDetails(this.doctor);
  @override
  _PatientDoctorDetailsState createState() => _PatientDoctorDetailsState();
}

class _PatientDoctorDetailsState extends State<PatientDoctorDetails> {
  _launchCaller(String url) async {
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorScreen,
      appBar: AppBar(
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // if (!snapshot.hasData) {
            //   return Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }
            return NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowGlow();
                return true;
              },
              child: ListView.builder(
                // itemCount: snapshot.data.size,
                itemCount: 1,
                itemBuilder: (context, index) {
                  // DocumentSnapshot document = snapshot.data.docs[index];
                  return Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Column(
                      children: <Widget>[
                        CircleAvatar(
                          child: Image.asset(
                            'assets/images/logo.png',
                            height: 140,
                            width: 140,
                            fit: BoxFit.cover,
                          ),
                          backgroundColor: transparentColor,
                          radius: 90,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Summit Tech",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Pediatritian",
                          style: TextStyle(fontSize: 18, color: Colors.black54),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // for (var i = 0; i < document['rating']; i++)

                            for (var i = 0; i < 3; i++)
                              Icon(
                                Icons.star_rounded,
                                color: Colors.indigoAccent,
                                size: 30,
                              ),
                            if (5 - 3 > 0)
                              for (var i = 0; i < 5 - 3; i++)
                                Icon(
                                  Icons.star_rounded,
                                  color: Colors.black12,
                                  size: 30,
                                ),
                          ],
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Icon(Icons.place_outlined),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.4,
                                child: Text(
                                  "Buea, Cameroon",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   height: MediaQuery.of(context).size.height / 12,
                        //   margin: EdgeInsets.symmetric(horizontal: 10),
                        //   child: Row(
                        //     children: [
                        //       SizedBox(
                        //         width: 15,
                        //       ),
                        //       Icon(Icons.phone),
                        //       SizedBox(
                        //         width: 11,
                        //       ),
                        //       TextButton(
                        //         onPressed: () =>
                        //             _launchCaller("tel:" + "document['phone']"),
                        //         child: Text(
                        //           "document['phone']".toString(),
                        //           style: TextStyle(
                        //               fontSize: 16, color: Colors.blue),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         width: 10,
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Icon(Icons.access_time_rounded),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Working Hours',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          padding: EdgeInsets.only(left: 60),
                          child: Row(
                            children: [
                              Text(
                                'Today: ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "9:00 am" + " - " + "7:00 pm",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        CustomButton(
                          child: Text('Book an Appointment'),
                          gradient: CustomTheme.buttonGradient,
                          onPressed: () {
                            // TODO: navigate to book appointment screen
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
