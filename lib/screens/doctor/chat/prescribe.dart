import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';
import 'package:medicare/utils/widgets/custom_button.dart';

class Prescribe extends StatefulWidget {
  final int userId;

  Prescribe({required this.userId});

  @override
  _PrescribeState createState() => _PrescribeState();
}

class _PrescribeState extends State<Prescribe> {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController caseHistoryEditingController = TextEditingController();
  TextEditingController medicationEditingController = TextEditingController();
  late String userName = 'Yannick';
  bool showSpinner = false;
  late String caseHistory;
  late String medication;

  void getUser() async {
//    final idToken = widget.token;
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String idToken = prefs.getString('token');
//     final userId = widget.userId;
//     final http.Response response =
//         await http.get('$remoteUrl/api/getPatient/$userId', headers: {
// //      HttpHeaders.authorizationHeader: 'Bearer $idToken',
//       HttpHeaders.contentTypeHeader: 'application/json'
//     });

//     print(response.body);
//     setState(() {
//       userName = json.decode(response.body)['data']['name'];
//     });
  }

  void submitForm() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text(
              'Prescription has been sent to the patient',
              style: TextStyle(color: Colors.green),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () => {Navigator.pop(context)},
              ),
            ],
          );
        });

    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String idToken = prefs.getString('token');
//    setState(() {
//      showSpinner = true;
//    });

    if (!formKey.currentState!.validate()) {
//      setState(() {
//        showSpinner = false;
//      });
      return;
    }
    formKey.currentState!.save();
    setState(() {
      showSpinner = true;
    });
    // final Map<String, dynamic> data = {
    //   'user_id': widget.userId,
    //   'case_history': caseHistory,
    //   'medication': medication,
    // };

    // final http.Response response = await http.post(
    //   'http://10.0.2.2:8000/api/doctor/prescription/make',
    //   headers: {
    //     HttpHeaders.authorizationHeader: 'Bearer $idToken',
    //     HttpHeaders.contentTypeHeader: 'application/json',
    //     HttpHeaders.acceptHeader: 'application/json'
    //   },
    //   body: json.encode(data),
    // );
    // if (response.statusCode == 200) {
    //   caseHistoryEditingController.clear();
    //   medicationEditingController.clear();
    //   setState(() {
    //     showSpinner = false;
    //   });
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text(
              'Prescription has been sent to the patient',
              style: TextStyle(color: Colors.green),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () => {Navigator.pop(context)},
              ),
            ],
          );
        });

    // }
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  void didUpdateWidget(Prescribe oldWidget) {
    getUser();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Prescription'),
        backgroundColor: primaryColor,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Patient Name: $userName',
            style: TextStyle(fontSize: 20),
          ),
          Divider(),
          Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Case History',
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  maxLines: 4,
                  // validator: (String value) {
                  //   if (value.isEmpty) {
                  //     return 'This field is required';
                  //   }
                  // },
                  controller: caseHistoryEditingController,
                  // onSaved: (String value) {
                  //   setState(() {
                  //     caseHistory = value;
                  //   });
                  // },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: medicationEditingController,
                  decoration: InputDecoration(
                    hintText: 'Case History',
                    contentPadding: EdgeInsets.all(20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  maxLines: 4,
                  // validator: (String value) {
                  //   if (value.isEmpty) {
                  //     return 'This field is required';
                  //   }
                  // },
                  //   onSaved: (String value) {
                  //     setState(() {
                  //       medication = value;
                  //     });
                  //   },
                ),
                CustomButton(
                  child: Text('Prescribe'),
                  onPressed: () => submitForm(),
                  gradient: CustomTheme.buttonGradient,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
