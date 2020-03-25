import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Pages/home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Timer(
      Duration(milliseconds: 1500),
      () => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => Home(),
          transitionsBuilder: (context, animation1, animation2, child) =>
              FadeTransition(opacity: animation1, child: child),
          transitionDuration: Duration(milliseconds: 2000),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(SplashPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.fill,
              alignment: Alignment.center,
            ),
          ),
          Center(
            child: Image.asset('assets/images/to-do.png'),
          ),
        ],
      ),
    );
  }
}
