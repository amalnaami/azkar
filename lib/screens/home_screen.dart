
import 'package:azkar_app/constant.dart';
import 'package:azkar_app/screens/azkar_screen.dart';
import 'package:azkar_app/screens/musbah_screen.dart';
import 'package:azkar_app/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static int _selectedPage = 2;

  List<Widget> _buildScreens() {
    return [ SettingScreen(),MusbahaScreen(),AzkarScreen(),];
  }

  bool select = false;

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.settings,
          size: 30,
        ),
        title: 'Setting',
        activeColor: goldenColor,
        inactiveColor: Colors.grey[200],
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.touch_app, size: 32),
        title: 'Edit Profile',
        activeColor: goldenColor,
        inactiveColor: Colors.grey[200],
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home, size: 30),
        title: 'Home',
        activeColor: goldenColor,
        inactiveColor: Colors.grey[200],
      ),
    ];
  }
  PersistentTabController _controller;
  bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 2);
    _hideNavBar = false;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return PersistentTabView(
      controller: _controller,
      navBarHeight: 60,
      iconSize: 40,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Color(0xff15120E),
      // backgroundColor: Color(0xff1A1A1A),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      hideNavigationBar: _hideNavBar,
      decoration: NavBarDecoration(
        colorBehindNavBar: Colors.indigo,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
      NavBarStyle.style5, // Choose the nav bar style with this property
    );
  }
}
