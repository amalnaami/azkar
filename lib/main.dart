import 'package:azkar_app/providers_models/azkar_db_helper.dart';
import 'package:azkar_app/providers_models/data_base_provider.dart';
import 'package:azkar_app/providers_models/musbaha_provider_model.dart';
import 'package:azkar_app/providers_models/sp_helper.dart';
import 'package:azkar_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.spHelper.initSharedPrefrences();
  if (SpHelper.spHelper.isFirstTime()) {
    print('dataFirstTime');
    await AzkarDBHelper.taskDBHelper.initTaskDataBase();
    SpHelper.spHelper.changeFirstTime();
  } else {
    print('dataNotFirstTime');

    await AzkarDBHelper.taskDBHelper.connectToTaskDataBase();
  }
  await translator.init(
      localeDefault: LocalizationDefaultType.device,
      languagesList: <String>['ar', 'en'],
      assetsDirectory: 'assets/lang/' // NOT YET TESTED
  );
  runApp(LocalizedApp(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return MusbahaProviderModel();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return DataBaseProvider();
          },
        ),
      ],
      child: MaterialApp(
        title: 'Azkar App',
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: translator.delegates,
        locale: translator.locale,
        supportedLocales: translator.locals(),
      ),
    );
  }
}
// translator.translate(
// onPressed: () {
// translator.setNewLanguage(
// context,
// newLanguage:
// translator.currentLanguage == 'ar'
// ? 'en'
//     : 'ar',
// remember: true,
// restart: true,
// );
// },