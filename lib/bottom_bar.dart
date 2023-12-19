import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:travel_app/cubits/add_to_firebase/add_to_firebase_cubit.dart';
import 'package:travel_app/cubits/home_cubit/home_cubit.dart';
import 'package:travel_app/widgets/helper/consts.dart';
import 'package:travel_app/views/bazar_view.dart';
import 'package:travel_app/views/home_view.dart';
import 'package:travel_app/views/profile_view.dart';
import 'package:travel_app/views/search_view.dart';

PersistentTabController _controller = PersistentTabController();

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});
  static String id = 'BottomBar';
  List<Widget> _buildScreens() {
    return [
      BlocProvider(
        create: (context) => HomeCubit(),
        child: const Homeview(),
      ),
      const BazarView(),
      BlocProvider(
        create: (context) => AddToFirebaseCubit(),
        child: const SearchView(),
      ),
      const ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: kPrimaryColorDark,
        inactiveColorPrimary: kBottomNavigatorBarItemColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_cart),
        title: ("Cart"),
        activeColorPrimary: kPrimaryColorDark,
        inactiveColorPrimary: kBottomNavigatorBarItemColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        title: ("Search"),
        activeColorPrimary: kPrimaryColorDark,
        inactiveColorPrimary: kBottomNavigatorBarItemColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Profile"),
        activeColorPrimary: kPrimaryColorDark,
        inactiveColorPrimary: kBottomNavigatorBarItemColor,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      // confineInSafeArea: true,
      backgroundColor: kPrimaryColor, // Default is Colors.white.
      // handleAndroidBackButtonPress: true, // Default is true.
      // resizeToAvoidBottomInset:
      //     true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      // stateManagement: true, // Default is true.
      // hideNavigationBarWhenKeyboardShows:
      //     true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      // popAllScreensOnTapOfSelectedTab: true,
      // popActionScreens: PopActionScreensType.all,
      // itemAnimationProperties: const ItemAnimationProperties(
      //   // Navigation Bar's items animation properties.
      //   duration: Duration(milliseconds: 200),
      //   curve: Curves.ease,
      // ),
      // screenTransitionAnimation: const ScreenTransitionAnimation(
      //   // Screen transition animation on change of selected tab.
      //   animateTabTransition: true,
      //   curve: Curves.ease,
      //   duration: Duration(milliseconds: 200),
      // ),
      navBarStyle:
          NavBarStyle.style12, // Choose the nav bar style with this property.
    );
  }
}

/*



*/
/*

*/
