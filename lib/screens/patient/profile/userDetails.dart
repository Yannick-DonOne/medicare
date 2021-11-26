import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  Future<void> _getUser() async {}

  List labelName = [
    'Name',
    'Email',
    'Mobile Number',
    'Birthday',
    'City',
  ];

  List value = [
    'Njume Yannick',
    'yannick@gmail.com',
    '671268292',
    '23/10/2001',
    'Buea',
  ];

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: FutureBuilder(
        builder: (context, snapshot) {
          return ListView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            children: List.generate(
              5,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: InkWell(
                  splashColor: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {},
                  child: Ink(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      height: MediaQuery.of(context).size.height / 14,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            labelName[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            value[index],
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
