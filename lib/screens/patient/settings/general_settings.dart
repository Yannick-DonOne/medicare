import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/theme.dart';

class GeneralSettings extends StatelessWidget {
  const GeneralSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _themes = ['Light Mode', 'Dark Mode'];
    List<String> _languages = ['English', 'French'];
    Size size = MediaQuery.of(context).size;
    ValueNotifier<String> currentTheme = ValueNotifier(_themes[0]);
    ValueNotifier<String> currentLanguage = ValueNotifier(_languages[0]);
    ValueNotifier<bool> notificationState = ValueNotifier(true);
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: size.height / 14,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Language',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ValueListenableBuilder<String>(
                    valueListenable: currentLanguage,
                    builder:
                        (BuildContext context, String value, Widget? child) {
                      return DropdownButton(
                        iconSize: size.width * 0.1,
                        value: value,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: black,
                        ),
                        items: _languages.map((String items) {
                          return DropdownMenuItem(
                              value: items, child: Text(items));
                        }).toList(),
                        onChanged: (newValue) {
                          currentLanguage.value = newValue.toString();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: size.height / 14,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Theme',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ValueListenableBuilder<String>(
                    valueListenable: currentTheme,
                    builder:
                        (BuildContext context, String value, Widget? child) {
                      return DropdownButton(
                        iconSize: size.width * 0.1,
                        value: value,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: black,
                        ),
                        items: _themes.map((String items) {
                          return DropdownMenuItem(
                              value: items, child: Text(items));
                        }).toList(),
                        onChanged: (newValue) {
                          currentTheme.value = newValue.toString();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: size.height / 14,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notification',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: notificationState,
                    builder: (BuildContext context, bool value, Widget? child) {
                      return Switch(
                        activeColor: primaryColor,
                        value: value,
                        onChanged: (state) {
                          notificationState.value = state;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
