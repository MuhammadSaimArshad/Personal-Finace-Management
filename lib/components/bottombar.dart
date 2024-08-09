import 'package:personal_finace_management/Expense.dart';
import 'package:personal_finace_management/HomeScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_finace_management/Income.dart';
import 'package:personal_finace_management/setting.dart';
import 'package:personal_finace_management/user_Edit_profile.dart';

class HomeNavbar extends StatefulWidget {
  const HomeNavbar({Key? key}) : super(key: key);

  @override
  State<HomeNavbar> createState() => _HomeNavbarState();
}

class _HomeNavbarState extends State<HomeNavbar> {
  int _selectedIndex = 0;
  final _screen = [
    const HomeScreen(),
    const ExpenseScreen(),
    const IncomeScreen(),
    SettingScreen(),
    const UserEditProfile(),
  ];
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _screen[_selectedIndex],
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black26,
            selectedLabelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.03),
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.badge_plus_radiowaves_right),
                label: "Expence",
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.inbox),
                label: "Income",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Setting",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
