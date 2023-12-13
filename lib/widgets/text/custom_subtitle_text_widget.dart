import 'package:flutter/material.dart';

class CustomSubTitleTextWidget extends StatelessWidget {
  const CustomSubTitleTextWidget(
      {super.key,
      this.fontSize = 12,
      required this.title,
      this.color = Colors.black});
  final double fontSize;
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      title,
      style: TextStyle(fontSize: fontSize, color: color),
    );
  }
}
