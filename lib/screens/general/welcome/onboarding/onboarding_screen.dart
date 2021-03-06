import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart' as flutter_svg;
import 'package:medicare/screens/general/option/option_screen.dart';
import 'package:medicare/utils/theme/theme.dart';

const List<String> assetNames = <String>[
  'assets/images/onboard1.svg',
  'assets/images/onboard2.svg',
  'assets/images/onboard3.svg'
];

class OnboardingScreen extends StatefulWidget {
  static String id = 'onboarding_screen';
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: _currentPage <= 1
          ? BoxDecoration(
              color: isActive ? whiteColor : grey,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            )
          : BoxDecoration(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            decoration: BoxDecoration(
              gradient: CustomTheme.primaryGradient,
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                _currentPage <= 1
                    ? Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => {
                            _currentPage <= 1
                                ? _pageController.animateToPage(
                                    2,
                                    duration: Duration(milliseconds: 150),
                                    curve: Curves.easeIn,
                                  )
                                : null,
                          },
                          child: Text(
                            'Skip',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        child: Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                Container(
                  height: size.height * (3 / 4),
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                        print('current page: $_currentPage');
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: flutter_svg.SvgPicture.asset(
                                assetNames[0],
                                width: size.width - 20,
                                height: 200,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Help On Demand',
                              style: TextStyle(
                                color: whiteColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: size.height * 0.05),
                            Text(
                              'Get quick care without an appointment for common conditions and everyday health concerns.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                height: 1.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: flutter_svg.SvgPicture.asset(
                                assetNames[2],
                                width: size.width - 20,
                                height: 200,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Resource Center',
                              style: TextStyle(
                                color: whiteColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: size.height * 0.05),
                            Text(
                              'Get the latest information on COVID-19 and other deceases and how they may affect you.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                height: 1.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: flutter_svg.SvgPicture.asset(
                                assetNames[1],
                                width: size.width - 20,
                                height: 200,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Health Safely',
                              style: TextStyle(
                                color: whiteColor,
                                fontWeight: FontWeight.w400,
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: size.height * 0.05),
                            Text(
                              'We are ready to care for you and your family and provide you the best and most professional medical assistance.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                height: 1.2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, OptionScreen.id);
              },
              child: Container(
                height: size.height * 0.09,
                width: double.infinity,
                color: Colors.white,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: Color(0xFF5B16D0),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
