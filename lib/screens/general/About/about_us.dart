import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';

class AboutUs extends StatefulWidget {
  static String id = 'about_us';

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  bool loading = false;

  String? aboutUs = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        backgroundColor: bgColorScreen,
        title: Text(
          "About SummitCare".toString(),
          style: TextStyle(
              fontSize: 18, color: primaryColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ut ante at elit convallis tincidunt non ac purus. Fusce accumsan ultrices tincidunt. In vitae eros ac turpis facilisis efficitur et id purus. Aenean convallis ante vel feugiat dictum. Vivamus lobortis tortor sed finibus fringilla. Nunc vel pretium ipsum. Proin vulputate ante ac magna mattis, a pellentesque libero mollis. Curabitur lobortis, ex a porta viverra, nisl nunc semper augue, et fringilla sem erat vitae nisi.',
        ),
      ),
    );
  }
}
