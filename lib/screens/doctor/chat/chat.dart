import 'package:flutter/material.dart';
import 'package:medicare/screens/doctor/chat/prescribe.dart';

import 'package:medicare/utils/theme/theme.dart';

class Chat extends StatefulWidget {
  final int patientID;

  Chat({required this.patientID});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final messageTextController = TextEditingController();
  late String messageText;
  late String doctorId;
  final messages = [
    {
      'message': 'Test message',
      'doctor_id': '1',
      'user_id': '1',
      'doctorId': '1'
    },
    {
      'message': 'Test message',
      'doctor_id': '1',
      'user_id': '1',
      'doctorId': '1'
    },
  ];

  Future setUserId() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(widget.userId);
    // prefs.setString('user_id', widget.userId.toString());
  }

  Future getUserId() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // setState(() {
    //   doctorId = prefs.getString('doctor_id');
    // });
//      return prefs.getString('id');
  }

  void messagesStream() async {
    // await for (var snapshot in _firestore.collection('messages').snapshots()) {
    for (var i = 0; i < messages.length; i++) {
      print('Messages:' '${messages[i]}');
    }
    // }
  }

  Future sendMessage() async {
    // messages.add(messages[2][messageTextController.text]);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String idToken = prefs.getString('token');
    // String userId = prefs.getString('user_id');

    // final Map<String, dynamic> data = {
    //   // 'user_id': '$userId',
    //   // 'message': '$messageText',
    //   // 'sender': 'doctor',
    // };

    // final http.Response response =
    //     await http.post('$remoteUrl/api/doctor/patient/chat',
    //         headers: {
    //           HttpHeaders.authorizationHeader: 'Bearer $idToken',
    //           HttpHeaders.contentTypeHeader: 'application/json',
    //           HttpHeaders.acceptHeader: 'application/json'
    //         },
    //         body: json.encode(data));

    // print(response.statusCode);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    messagesStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: new AppBar(
          actions: <Widget>[
            // Text('Create Prescription'),
            IconButton(
                icon: Icon(Icons.book),
                tooltip: 'Create prescription',
                onPressed: () {
                  //  Implement logout functionality
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (
                        BuildContext context,
                      ) =>
                          Prescribe(
                        userId: 1,
                      ),
                    ),
                  );
                }),
          ],
          title: Text('⚡️Chat'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              MessagesStream(),
              Container(
                decoration: BoxDecoration(
                  gradient: CustomTheme.primaryGradient,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: messageTextController,
                        onChanged: (value) {
                          //Do something with the user input.
                          messageText = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        //Implement send functionality.
                        messageTextController.clear();
                        // final SharedPreferences prefs =
                        //     await SharedPreferences.getInstance();

                        // String doctorId = prefs.getString('doctor_id');
                        // _firestore.collection("messages").add({
                        //   'user_id': widget.userId.toString(),
                        //   'doctor_id': doctorId.toString(),
                        //   'message': messageText,
                        //   'sender': 'doctor',
                        //   'timestamp':
                        //       DateTime.now().millisecondsSinceEpoch.toString(),
                        // });

                        sendMessage();
                      },
                      child: Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class MessagesStream extends StatefulWidget {
  @override
  _MessagesStreamState createState() => _MessagesStreamState();
}

class _MessagesStreamState extends State<MessagesStream> {
  late String userId = '2';
  late String doctorId;

  Future getUserId() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // setState(() {
    //   userId = prefs.getString('user_id');
    // });

//      return prefs.getString('id');
  }

  Future getDoctorId() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // setState(() {
    //   doctorId = prefs.getString('doctor_id');
    // });
  }

  @override
  void initState() {
    getDoctorId();
    getUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        // if (!snapshot.hasData) {
        //   return Center(child: Text(''));
        // }
        final messages = [
          {
            'message': 'Test message',
            'doctor_id': '1',
            'user_id': '2',
            'doctorId': '1',
            'sender': 'doctor',
            'timestamp': DateTime.now().hour.toString() +
                ':' +
                DateTime.now().minute.toString(),
          },
          {
            'message': 'Test message 1',
            'doctor_id': '1',
            'user_id': '2',
            'doctorId': '1',
            'sender': 'patient',
            'timestamp': DateTime.now().hour.toString() +
                ':' +
                DateTime.now().minute.toString(),
          },
          {
            'message': 'Hi',
            'doctor_id': '1',
            'user_id': '2',
            'doctorId': '1',
            'sender': 'doctor',
            'timestamp': DateTime.now().hour.toString() +
                ':' +
                DateTime.now().minute.toString(),
          },
          {
            'message': 'Hello',
            'doctor_id': '1',
            'user_id': '2',
            'doctorId': '1',
            'sender': 'patient',
            'timestamp': DateTime.now().hour.toString() +
                ':' +
                DateTime.now().minute.toString(),
          },
        ];
        List<MessageBubble> messageBubbles = [];

        for (var message in messages) {
          final messageText = message['message'];
          final messageTime = message['timestamp'];
          final messageSender = message['doctor_id'];
          final messageReceiver = message['user_id'];
          final currentUser = "1";

          final messageBubble = MessageBubble(
            time: messageTime!,
            text: messageText!,
            // isMe: message.data['sender'] == 'doctor',
            isMe: message['sender'] == 'doctor',
          );
          print(messages);
          print(messageTime);
          print(userId);
          if ((messageSender == currentUser) && (messageReceiver == userId)) {
            messageBubbles.add(messageBubble);
            print('Messages in sctream: $messageBubble');
          }
        }

        return Expanded(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            children: messageBubbles,
            reverse: true,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String time;
  final String text;
  final bool isMe;

  MessageBubble({required this.time, required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: <Widget>[
        Text(time),
        Material(
          elevation: 5.0,
          borderRadius: isMe
              ? BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
              : BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
          color: isMe ? primaryColor : whiteColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              '$text',
              style: TextStyle(
                fontSize: 15.0,
                color: isMe ? whiteColor : black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
