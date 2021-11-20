import 'package:flutter/material.dart';

class PatientAppointmentList extends StatefulWidget {
  @override
  _PatientAppointmentListState createState() => _PatientAppointmentListState();
}

class _PatientAppointmentListState extends State<PatientAppointmentList> {
  void _deleteAppointment(String appID) {}

  // String _dateFormatter(String _timestamp) {
  //   String formattedDate =
  //       DateFormat('dd-MM-yyyy').format(DateTime.parse(_timestamp));
  //   return formattedDate;
  // }

  // String _timeFormatter(String _timestamp) {
  //   String formattedTime =
  //       DateFormat('kk:mm').format(DateTime.parse(_timestamp));
  //   return formattedTime;
  // }

  showAlertDialog(BuildContext context) {
    // set up the buttons
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

  _checkDiff(DateTime _date) {
    var diff = DateTime.now().difference(_date).inHours;
    if (diff > 2) {
      return true;
    } else {
      return false;
    }
  }

  _compareDate(String _date) {
    // if (_dateFormatter(DateTime.now().toString())
    //         .compareTo(_dateFormatter(_date)) ==
    //     0) {
    //   return true;
    // } else {
    //   return false;
    // }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          alignment: Alignment.center,
          // padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'My Appointments',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 10, left: 10, top: 10),
        child: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            // if (!snapshot.hasData) {
            //   return Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }
            return
                // snapshot.data.size == 0
                //     ? Center(
                //         child: Text(
                //           'No Appointment Scheduled',
                //           style: TextStyle(
                //             color: Colors.grey,
                //             fontSize: 18,
                //           ),
                //         ),
                //       )
                //     :
                ListView.builder(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              // itemCount: snapshot.data.size,
              itemBuilder: (context, index) {
                // DocumentSnapshot document = snapshot.data.docs[index];
                // print(_compareDate(document['date'].toDate().toString()));
                // if (_checkDiff(document['date'].toDate())) {
                //   deleteAppointment(document.id);
                // }
                return Card(
                  elevation: 2,
                  child: InkWell(
                    onTap: () {},
                    child: ExpansionTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "Njume Yannick",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            DateTime.now().toString(),
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 0,
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.",
                          style: TextStyle(),
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 20, right: 10, left: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Doctor name: " + 'Njume Yannick',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Time: " + DateTime.now().toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                tooltip: 'Delete Appointment',
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.black87,
                                ),
                                onPressed: () {
                                  showAlertDialog(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
