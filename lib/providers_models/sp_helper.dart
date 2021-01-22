import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  SharedPreferences sharedPreferences;
  initSharedPrefrences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  bool isFirstTime() {
    print('isFirst');
    bool isFirstTime = sharedPreferences.getBool('isFirstTime');
    return isFirstTime ?? true;
  }

  changeFirstTime() {
    sharedPreferences.setBool('isFirstTime', false);
    print('NotFirst');

  }

}
