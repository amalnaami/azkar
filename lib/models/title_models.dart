import 'package:azkar_app/constant.dart';
import 'package:flutter/material.dart';

class TitleModels extends StatelessWidget {
  String title;
  TitleModels({this.title});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
            top: MediaQuery
                .of(context)
                .size
                .width / 10),
        width: MediaQuery
            .of(context)
            .size
            .width / 3,
        child: Text(
          title,
          style: dataStyle.copyWith(color: Colors.black),
        ),
        decoration: BoxDecoration(
          color: goldenColor.withOpacity(.8),
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}


class LanguageItem extends StatefulWidget {
  String title;
  int val;
  LanguageItem({this.val,this.title});
  @override
  _LanguageItemState createState() => _LanguageItemState();
}

class _LanguageItemState extends State<LanguageItem> {
  int groupValue;
  @override
  Widget build(BuildContext context) {
    return   Expanded(
        child: Row(
          children: [
            Text(
              widget.title,
              style: dataStyle,
            ),
            Expanded(
              child: RadioListTile(
                value: widget.val,
                activeColor: Colors.grey,
                groupValue: widget.val,
                onChanged: (value) {
                  setState(() {

                  });
                  groupValue= value ;
                },
              ),
            ),
          ],
        ));
  }
}
