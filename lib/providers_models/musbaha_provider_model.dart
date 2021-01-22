import 'package:flutter/material.dart';

class MusbahaProviderModel extends ChangeNotifier {
  int counter = 0;
  incrementCounter(){
    counter++;
    notifyListeners();
  }
  clearCounter(){
    counter=0;
    notifyListeners();
  }


}