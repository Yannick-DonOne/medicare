import 'package:flutter/material.dart';

class AppointmentHistoryList extends StatefulWidget {
  @override
  _AppointmentHistoryListState createState() => _AppointmentHistoryListState();
}

class _AppointmentHistoryListState extends State<AppointmentHistoryList> {
  Future<void> _getUser() async {}

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
                          "Yannick DonOne",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Tooth ache",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateTime.now().toString(),
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
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
