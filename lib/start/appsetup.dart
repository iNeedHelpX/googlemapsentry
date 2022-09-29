import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:googlemapsentry/colors/colours_list.dart';
import 'package:googlemapsentry/pages/account_page.dart';
import 'package:googlemapsentry/pages/home_page.dart';
import 'package:googlemapsentry/pages/map_page.dart';
import 'package:googlemapsentry/start/app_bars/listbaricons.dart';
import 'package:googlemapsentry/start/app_bars/radialbar.dart';

class AppSetup extends StatefulWidget {
  AppSetup({Key? key}) : super(key: key);

  @override
  _AppSetupState createState() => _AppSetupState();
}

class _AppSetupState extends State<AppSetup> {
  int selectedpage = 0;

  final _pageOptions = const [
//pages
    HomePage(),
    MapPage(),
    AccountPage(),
  ];

  CurvedNavigationBar curvedNavBar() {
    return CurvedNavigationBar(
      index: selectedpage,
      buttonBackgroundColor: containerback,
      color: barback.withOpacity(0.8),
      backgroundColor: Colors.transparent,
      animationCurve: Curves.linearToEaseOut,
      items: listBarIcons(),
      onTap: (index) {
        setState(() {
          selectedpage =
              index; // changing selected page as per bar index selected by the user
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      extendBodyBehindAppBar: true,
      appBar: myRadialBar(context),
      body: _pageOptions[selectedpage],
      extendBody: true,
      bottomNavigationBar: curvedNavBar(),
    );
  }
}
