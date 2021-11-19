import 'package:flutter/material.dart';

class AppointmentHistoryList extends StatefulWidget {
  @override
  _AppointmentHistoryListState createState() => _AppointmentHistoryListState();
}

class _AppointmentHistoryListState extends State<AppointmentHistoryList> {
  Future<void> _getUser() async {}

  // String _dateFormatter(String _timestamp) {
  // String formattedDate =
  //     DateFormat('dd-MM-yyyy').format(DateTime.parse(_timestamp));
  // return formattedDate;
  // }

  // Future<void> deleteAppointment(String docID) {
  //   return FirebaseFirestore.instance
  //       .collection('appointments')
  //       .doc(user.email.toString())
  //       .collection('all')
  //       .doc(docID)
  //       .delete();
  // }

  // String _timeFormatter(String _timestamp) {
  //   String formattedTime =
  //       DateFormat('kk:mm').format(DateTime.parse(_timestamp));
  //   return formattedTime;
  // }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // if (!snapshot.hasData) {
          //   return Center(
          //     child: CircularProgressIndicator(),
          //   );
          // }
          return
              // snapshot.data.size == 0
              //     ? Text(
              //         'History Appears here...',
              //         style: TextStyle(
              //           color: Colors.grey,
              //           fontSize: 18,
              //         ),
              //       )
              //     :
              ListView.builder(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 1,
            // itemCount: snapshot.data.size,
            itemBuilder: (context, index) {
              // DocumentSnapshot document = snapshot.data.docs[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // padding: EdgeInsets.only(left: 10, top: 5),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blueGrey[50],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "document['doctor']",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "_dateFormatter(document['date'].toDate().toString())",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
