import 'dart:async';

import 'package:azkar_app/constant.dart';
import 'package:azkar_app/providers_models/data_base_provider.dart';
import 'package:azkar_app/screens/azkar_screen.dart';
import 'package:azkar_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) {
      Provider.of<DataBaseProvider>(context, listen: false).getAllTasks();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return MainScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 3)).then((value) {
    //   Provider.of<DataBaseProvider>(context, listen: false).getAllTasks();
    //   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
    //     return MainScreen();
    //   }));
    // });
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      blackColor.withOpacity(.6), BlendMode.dstATop),
                  image: AssetImage('assets/image/background.jpg'),
                  fit: BoxFit.cover)),
          alignment: Alignment.center,
          child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: goldenColor.withOpacity(.7),
                  blurRadius: 15,
                  offset: Offset(0, 2),
                  spreadRadius: 2,
                )
              ], shape: BoxShape.circle, color: Colors.black),
              alignment: Alignment.center,
              child: Text(
                'أذكار\nالمسلم',
                style: logoStyle,
                textAlign: TextAlign.center,
              ))),
    );
  }
}
