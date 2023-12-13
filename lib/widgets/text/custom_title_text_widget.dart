import 'package:flutter/material.dart';
import 'package:travel_app/consts.dart';

class CustomTitleTextWidget extends StatelessWidget {
  const CustomTitleTextWidget(
      {super.key, this.fontSize = 18, required this.title});
  final double fontSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        color: kPrimaryColorDark,
      ),
    );
  }
}
