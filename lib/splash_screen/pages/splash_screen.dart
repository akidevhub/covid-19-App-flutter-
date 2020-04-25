import 'dart:async';

import 'package:covid_19_app/splash_screen/pages/ConnectionStatusBar.dart';
import 'package:covid_19_app/utils/Animation/FadeAnimation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
//  startTime() async {
//    var _duration = new Duration(seconds: 3);
//    return new Timer(_duration, navigationPage);
//  }
//
//  void navigationPage() {
//    Navigator.of(context).pushReplacementNamed('/covidPage');
//  }

  @override
  void initState() {
    super.initState();
//    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: EdgeInsets.all(23),
                  child: ListView(
                    children: <Widget>[
                      FadeAnimation(
                          1,
                          Image.asset(
                            'assets/images/splashimage.jpg',
//                        width: 200,
//                        height: 200,
                          )),
                      SizedBox(height: 120),
                      FadeAnimation(
                          1.5,
                          Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Center(
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "C O V I D 19",
                                      style: TextStyle(
                                        fontFamily: 'SFUIDisplay',
                                        color: Colors.deepOrange,
                                        fontSize: 30,
                                      )),
                                ]),
                              ),
                            ),
                          )),
                      FadeAnimation(
                          1.8,
                          Padding(
                            padding: EdgeInsets.only(top: 20, left: 40),
                            child: Center(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    'Covid 19 World Pandmic Information ',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'SFUIDisplay',
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                      FadeAnimation(
                          2,
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/covidPage');
                              },
                              child: Text(
                                'GET START',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'SFUIDisplay',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              color: Colors.redAccent,
                              elevation: 0,
                              minWidth: 350,
                              height: 60,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                          )),
                      SizedBox(height: 35),
                      Container(
                        padding: EdgeInsets.only(top: 18),
                        child: Center(
                          child: Text(
                            'Develop by Aki',
                            style: TextStyle(
                                fontFamily: 'SFUIDisplay',
                                fontSize: 10,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: ConnectionStatusBar(),
          ),
        ],
      ),
    );
  }
}
