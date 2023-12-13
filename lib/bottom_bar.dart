import 'package:flutter/material.dart';
import 'package:travel_app/consts.dart';
import 'package:travel_app/views/bazar_view.dart';
import 'package:travel_app/views/home_view.dart';
import 'package:travel_app/views/profile_view.dart';
import 'package:travel_app/views/search_view.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  static const List<Widget> views = <Widget>[
    Homeview(),
    BazarView(),
    SearchView(),
    ProfileView(),
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
        child: views.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: kPrimaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
            backgroundColor: kPrimaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: kPrimaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: kPrimaryColor,
          ),
        ],
        currentIndex: _selectedIndex,
        fixedColor: kPrimaryColorDark,
        unselectedItemColor: kBottomNavigatorBarItemColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
