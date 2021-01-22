import 'package:azkar_app/constant.dart';
import 'package:flutter/material.dart';

class AzkarModel extends StatelessWidget {
  String title;
  Function action;
  AzkarModel({this.title,this.action});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.width / 5,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: goldenColor.withOpacity(.1),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(10),
        child: Text(
          title,
          style: dataStyle,
        ),
      ),
    );
  }
}
