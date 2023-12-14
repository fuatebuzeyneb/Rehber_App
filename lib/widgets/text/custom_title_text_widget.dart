import 'package:flutter/material.dart';
import 'package:travel_app/widgets/helper/consts.dart';

class CustomTitleTextWidget extends StatelessWidget {
  const CustomTitleTextWidget(
      {super.key,
      this.fontSize = 18,
      required this.title,
      this.color = kPrimaryColorDark});
  final double fontSize;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
