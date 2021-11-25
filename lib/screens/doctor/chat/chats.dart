import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';

import 'chat.dart';

class DoctorChats extends StatefulWidget {
  static String id = 'doctor_DoctorChats';
  @override
  _DoctorChatsState createState() => _DoctorChatsState();
}

class _DoctorChatsState extends State<DoctorChats> {
  late List patients = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  List userIds = [];
  Map<String, dynamic> user = {};

  Future getPatients() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String idToken = prefs.getString('token');

    // final http.Response response = await http.get(
    //   '$remoteUrl/api/doctor/patients',
    //   headers: {
    //     HttpHeaders.authorizationHeader: 'Bearer $idToken',
    //     HttpHeaders.contentTypeHeader: 'application/json',
    //     HttpHeaders.acceptHeader: 'application/json'
    //   },
    // );
    // print(response.statusCode);
    // if (response.statusCode == 200) {
    //   setState(() {
    //     patients = jsonDecode(response.body);
    //   });
    // }

    print(patients);
  }

//  void messagesStream() async {
//    final SharedPreferences prefs = await SharedPreferences.getInstance();
//    String doctorId = prefs.getString('doctor_id');
//    print(doctorId);
//    await for (var snapshot in _firestore.collection('messages').snapshots()) {
//      for (var message in snapshot.documents) {
//        if (message.data['doctor_id'] == doctorId) print(message.data);
//        userIds.add(int.parse(message.data['user_id']));
//      }
//
//      userIds = userIds.toSet().toList();
//      print(userIds);
//
//      for (int i = 0; i < userIds.length; i++) {
//        int id = userIds[i];
//
//        final http.Response response =
//            await http.get('$remoteUrl/api/getPatient/$id', headers: {
//          HttpHeaders.contentTypeHeader: 'application/json',
//          HttpHeaders.acceptHeader: 'application/json'
//        });
////        patients.addAll(json.decode(response.body));
//        setState(() {
//          user = json.decode(response.body);
//        });
//        patients.add(user);
//
////        print(users);
////        print(json.decode(response.body));
////        print(patients);
////        print(users);
//
//      }
////      print(patients);
////      patients = users;
//      print(user);
//    }
//  }

  @override
  void initState() {
//    messagesStream();
    getPatients();
    super.initState();
  }

  @override
  void didUpdateWidget(DoctorChats oldWidget) {
    getPatients();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView.builder(
            itemCount: patients.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Chat(patientID: 1),
                    ),
                  );
                },
                child: Card(
                  elevation: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Row(
                      children: <Widget>[
                        Stack(
                          children: [
                            CircleAvatar(
                              backgroundColor: primaryColor,
                              child: Image.asset(
                                'assets/images/logo.png',
                                fit: BoxFit.contain,
                              ),
                              radius: size.width * 0.1,
                            ),
                            CircleAvatar(
                              backgroundColor: success,
                              radius: 10,
                            ),
                          ],
                        ),
                        SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.52,
                                  child: Text(
                                    '' + "Njume Yannick",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                ),
                                Text(
                                  DateTime.now().hour.toString() +
                                      ':' +
                                      DateTime.now().minute.toString(),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: MediaQuery.of(context).size.width * 4 / 6,
                              child: Text(
                                "Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore ets eiusmod tempor",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 4 / 6,
                              child: Text(
                                "South West" + ' | ' + "Mayor Street",
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(height: 10)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            })
        // : Center(
        //     child: Text('No Chats available'),
        //   ),
        );
  }
}
