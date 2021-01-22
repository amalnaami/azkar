import 'package:azkar_app/constant.dart';
import 'package:azkar_app/models/title_models.dart';
import 'package:azkar_app/providers_models/musbaha_provider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MusbahaScreen extends StatefulWidget {
  @override
  _MusbahaScreenState createState() => _MusbahaScreenState();
}

class _MusbahaScreenState extends State<MusbahaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    blackColor.withOpacity(.4), BlendMode.dstATop),
                image: AssetImage('assets/image/logofinal.png'),
                fit: BoxFit.cover)),
        child: Consumer<MusbahaProviderModel>(
          builder: (context, value, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                TitleModels(
                  title: 'المسبحة',
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    InkWell(
                      onTap: value.incrementCounter,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 80),
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: goldenColor.withOpacity(.3),
                              blurRadius: 10,
                              offset: Offset(0, 2),
                              spreadRadius: 2,
                            )
                          ], shape: BoxShape.circle, color: Colors.black),
                          alignment: Alignment.center,
                          child: Text(
                            value.counter.toString(),
                            style: TextStyle(
                                fontSize: 28,
                                color: goldenColor,
                                fontFamily: 'font',
                                fontWeight: FontWeight.normal),
                          )),
                    ),
                    InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Color(0xff15120E),
                                elevation: 5,
                                title: Text(
                                  'إعادة تعيين',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'font',
                                      fontSize: 18,
                                      color: goldenColor),
                                ),
                                content: Text(
                                  'هل أنت متأكد من إعادة تعيين ؟',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'font',
                                      fontSize: 18,
                                      color: goldenColor),
                                ),
                                actions: [
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'لا',
                                        style: TextStyle(
                                            fontFamily: 'font',
                                            fontSize: 22,
                                            color: Colors.grey),
                                      )),
                                  FlatButton(
                                      onPressed: () {
                                        value.clearCounter();
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'نعم',
                                        style: TextStyle(
                                            fontFamily: 'font',
                                            fontSize: 18,
                                            color: Colors.grey[100]),
                                      ))
                                ],
                              );
                            });
                      },
                      child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: goldenColor.withOpacity(.4),
                              blurRadius: 10,
                              offset: Offset(0, 2),
                              spreadRadius: 1,
                            )
                          ], shape: BoxShape.circle, color: Colors.black),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.refresh,
                            size: 32,
                            color: goldenColor,
                          )),
                    ),
                  ],
                ),
                SizedBox(),
              ],
            );
          },
        ),
      ),
    );
  }
}
