import 'package:azkar_app/constant.dart';
import 'package:azkar_app/models/three_azkar_model.dart';
import 'package:azkar_app/models/title_models.dart';
import 'package:azkar_app/providers_models/data_base_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MorningAzkar extends StatefulWidget {
  @override
  _MorningAzkarState createState() => _MorningAzkarState();
}

class _MorningAzkarState extends State<MorningAzkar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DataBaseProvider>(builder: (context, value, child) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      blackColor.withOpacity(.2), BlendMode.dstATop),
                  image: AssetImage('assets/image/logofinal.png'),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TitleModels(
                title: 'أذكار الصباح',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Column(
                      children: value.morningAzkar
                          .map((e) => ThreeAzkarModel(e))
                          .toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
