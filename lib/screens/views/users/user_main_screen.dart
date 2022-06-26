import 'package:ekub/screens/views/users/user_home_screen.dart';
import 'package:ekub/screens/views/users/user_drop_screen.dart';
import 'package:ekub/screens/views/users/user_wallet_screen.dart';
import 'package:ekub/theme/app_color.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserMainScreen extends StatefulWidget {
  const UserMainScreen({Key? key}) : super(key: key);

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = [
    const UserHomeScreen(),
    UserWalletScreen(),
    UserDropScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
          child: Container(
        // margin: const EdgeInsets.all(10),
        // padding: const EdgeInsets.symmetric(horizontal: 10),
        child: FancyBottomNavigation(
          circleColor: AppColor.primaryColor,
          tabs: [
            TabData(iconData: FontAwesomeIcons.house, title: "Home"),
            TabData(iconData: FontAwesomeIcons.wallet, title: "Wallet"),
            TabData(iconData: FontAwesomeIcons.piggyBank, title: "Drop")
          ],
          onTabChangedListener: (position) {
            setState(() {
              _selectedIndex = position;
            });
          },
        ),
      )),
    );
  }
}
