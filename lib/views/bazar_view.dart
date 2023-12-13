import 'package:flutter/material.dart';
import 'package:travel_app/consts.dart';
import 'package:travel_app/widgets/appbar/custom_appbar_widget.dart';

class BazarView extends StatelessWidget {
  const BazarView({super.key});
  static String id = 'BazarView';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: CustomAppBarWidget(
          title: 'Bazar',
        ),
      ),
    );
  }
}
