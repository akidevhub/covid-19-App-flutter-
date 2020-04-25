import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_app_rest_api/src/pages/CartPage.dart';
//import 'package:flutter_app_rest_api/src/pages/HomePage.dart';
//import 'package:flutter_app_rest_api/src/pages/ProfilePage1.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_screen.dart';

class Dashboard extends StatefulWidget {
  final String title;
  Dashboard({Key key , this.title}) : super(key : key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedPosition = 0;
  List<Widget> listBottomWidget = new List();

  @override
  void initState() {
    super.initState();
    addHomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.globe), title: Text("World")),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.search), title: Text("Search")),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.userLock), title: Text("Srilanka")),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.search), title: Text("Country")),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.handHolding), title: Text("Info")),
        ],
        currentIndex: selectedPosition,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Color(0xff1D3F72),
        onTap: (position) {
          setState(() {
            selectedPosition = position;
          });
        },
      ),
      body: Builder(builder: (context) {
        return listBottomWidget[selectedPosition];
      }),
    );
  }

  void addHomePage() {
    listBottomWidget.add(Home());
//    listBottomWidget.add(SearchPage());
//    listBottomWidget.add(CartPage());
//    listBottomWidget.add(ProfilePage1());
  }

}
