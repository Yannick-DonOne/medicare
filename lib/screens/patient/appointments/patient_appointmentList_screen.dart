import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColorScreen,
      body: Container(
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
                Size size = MediaQuery.of(context).size;
                return Card(
                  elevation: 2,
                  child: InkWell(
                    onTap: () {},
                    child: ExpansionTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Njume Yannick ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 2,
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
                      subtitle: Text(
                        "Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.",
                        style: TextStyle(),
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
                                      fontSize: 15,
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
