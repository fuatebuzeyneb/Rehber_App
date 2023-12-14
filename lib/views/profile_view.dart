import 'package:flutter/material.dart';
import 'package:travel_app/widgets/helper/consts.dart';
import 'package:travel_app/widgets/appbar/custom_appbar_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static String id = 'ProfileView';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: CustomAppBarWidget(
          title: 'Profile',
        ),
      ),
    );
  }
}
