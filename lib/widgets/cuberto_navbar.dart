import 'package:flutter/material.dart';
import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:instacart/sceens/home_page.dart';

import '../sceens/categories_screen.dart';
import '../sceens/dashbord_another.dart';
import '../sceens/profile_screen.dart'; // ensure this path is correct

class BottomBarExample extends StatefulWidget {
  @override
  _BottomBarExampleState createState() => _BottomBarExampleState();
}

class _BottomBarExampleState extends State<BottomBarExample> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DashbordPage(),
    CategoriesScreen(),
    ProfileScreen(),
    ProfileScreen()
  ];

  Future<bool> _onWillPop() async {
    if (_selectedIndex != 0) {
      setState(() {
        _selectedIndex = 0; // Go back to Home tab
      });
      return false; // Don't exit the app
    }
    return true; // Exit app
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: CubertoBottomBar(
          selectedTab: _selectedIndex,
          onTabChangedListener: (position, title, color) {
            setState(() {
              _selectedIndex = position;
            });
          },
          tabs: [
            TabData(iconData: Icons.home, title: "Home"),
            TabData(iconData: Icons.category, title: "Categories"),
            TabData(iconData: Icons.search, title: "Search"),
            TabData(iconData: Icons.person, title: "Profile"),
          ],
          tabStyle: CubertoTabStyle.styleNormal, // Use valid style here
          tabColor: Colors.green,
          inactiveIconColor: Colors.grey,
          barBackgroundColor: Color(0xFF5B6840),
        ),
      ),
    );
  }
}
