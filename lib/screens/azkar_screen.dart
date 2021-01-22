import 'package:azkar_app/constant.dart';
import 'package:azkar_app/models/azkar_model.dart';
import 'package:azkar_app/models/title_models.dart';
import 'package:azkar_app/screens/evening_azkar.dart';
import 'package:azkar_app/screens/morning_azkar.dart';
import 'package:azkar_app/screens/sleep_azkar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class AzkarScreen extends StatefulWidget {
  @override
  _AzkarScreenState createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      blackColor.withOpacity(.4), BlendMode.dstATop),
                  image: AssetImage('assets/image/logofinal.png'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleModels(
                title: 'الأذكار',
              ),

              Column(
                children: [
                  AzkarModel(
                    title: 'أذكار الصباح',
                    action: () {
                      pushNewScreen(
                        context,
                        screen: MorningAzkar(),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  AzkarModel(
                    title: 'أذكار المساء',
                    action: () {
                      pushNewScreen(
                        context,
                        screen: EveningAzkar(),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  AzkarModel(
                    title: 'أذكار النوم',
                    action: () {
                      pushNewScreen(
                        context,
                        screen: SleepAzkar(),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                  ),
                  AzkarModel(
                    title: 'أذكار الصلاة',
                    action: () {
                      pushNewScreen(
                        context,
                        screen: SleepAzkar(),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
