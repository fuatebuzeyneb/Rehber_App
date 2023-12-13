import 'package:flutter/material.dart';
import 'package:travel_app/consts.dart';
import 'package:travel_app/widgets/text/custom_subtitle_text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size.width * 0.15,
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: CustomSubTitleTextWidget(
            title: title,
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
