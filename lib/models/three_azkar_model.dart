import 'package:azkar_app/constant.dart';
import 'package:azkar_app/providers_models/azkar_db_model.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ThreeAzkarModel extends StatelessWidget {
  AzkarModelDb newAzkarModelDb;

  ThreeAzkarModel(this.newAzkarModelDb);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: goldenColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
      newAzkarModelDb.text1,
            textAlign: TextAlign.center,
            style: dataStyle.copyWith(fontWeight: FontWeight.w100,fontSize: 12.5,color: Colors.grey[200]),
          ),
          Text(
            newAzkarModelDb.text2!=null?newAzkarModelDb.text2:'',
            style: dataStyle.copyWith(fontWeight: FontWeight.normal,fontSize: 12),
          ),
        ],
      ),
    );
  }
}
