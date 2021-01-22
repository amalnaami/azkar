import 'package:azkar_app/constant.dart';
import 'package:azkar_app/models/title_models.dart';
import 'package:azkar_app/providers_models/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  sharePost(String post) {
    Share.share(post);
  }

  makeCall(int phone) async {
    if (await canLaunch('tel:$phone')) {
      await launch('tel:$phone');
    } else {
      print('Can not open');
    }
  }

  sendEmail(String otherEmail, String title, String data) async {
    Uri uri = Uri(
      scheme: 'mailto',
      path: otherEmail,
      query: 'body=$data &subject=$title',
    );
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      print('Can not open');
    }
  }

  openUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      print('Can not open');
    }
  }
void launchWhatsApp({
  @required String phone,
  @required String message,
}) async {
  String url() {
    if (Platform.isIOS) {
      return "whatsapp://wa.me/$phone/?text=${Uri.parse(message)}";
    } else {
      return "whatsapp://send?   phone=$phone&text=${Uri.parse(message)}";
    }
  }

  if (await canLaunch(url())) {
    await launch(url());
  } else {
    throw 'Could not launch ${url()}';
  }
}
sharePhoto() async {
  PickedFile pickedFile =
      await ImagePicker().getImage(source: ImageSource.camera);
  Share.shareFiles(['${pickedFile.path}'],
      text: 'Great picture', subject: 'subject');
}

sendSms(int number, String content) async {
  Uri uri = Uri(
      scheme: 'sms',
      path: '$number',
      queryParameters: {'body': 'hello this is my first sms'});
  if (await canLaunch(uri.toString())) {
    await launch(uri.toString());
  } else {
    print('phone cant open this url');
  }
}

  int groupValue = 0;
  int groupValue1 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: goldenColor,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TitleModels(
              title: 'الإعدادات',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 3,
            ),

            Container(
              height: MediaQuery.of(context).size.width / 6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: goldenColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RadioListTile(
                      dense: true,
                      title: Text(
                        'مضيء',
                        style: dataStyle.copyWith(fontSize: 12),
                      ),
                      value: 0,
                      activeColor: Colors.grey[200],
                      groupValue: groupValue1,
                      onChanged: (value) {
                        setState(() {

                            // Provider.of<ThemeProvider>(context, listen: false).swapTheme();

                          print('dhjdk');
                          groupValue1 = value;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      dense: true,
                      title: Text(
                        'مظلم',
                        style: dataStyle.copyWith(fontSize: 12),
                      ),
                      value: 1,
                      activeColor: Colors.grey[200],
                      groupValue: groupValue1,
                      onChanged: (value) {
                        setState(() {
                          // Provider.of<ThemeProvider>(context, listen: false).swapTheme();

                          this.groupValue1 = value;
                        });
                      },
                    ),
                  ),
                  Text(
                    ' :  الوضع',
                    style: dataStyle,
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.width / 6,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: goldenColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      onTap: () {
                        makeCall(972597198547);
                      },
                      child: Icon(
                        Icons.phone_in_talk,
                        size: 24,
                        color: Colors.grey[200],
                      )),
                  InkWell(
                      onTap: () {
                        sendEmail(
                            'amalahmadnaami97@gmail.com', 'Test', ' ');
                      },
                      child: Icon(
                        Icons.email,
                        size: 24,
                        color: Colors.grey[200],
                      )),
                  InkWell(
                      onTap: () {
                        openUrl(
                            'https://www.facebook.com/profile.php?id=100010581810969');
                      },
                      child: Image.asset(
                        'assets/image/face.png',
                        width: 20,
                        height: 20,
                        color: Colors.grey[200],
                      )),

                  Text(
                    ' :  تواصل معنا',
                    style: dataStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
