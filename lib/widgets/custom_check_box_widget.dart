import 'package:flutter/material.dart';
import 'package:travel_app/widgets/helper/consts.dart';

class CustomCheckBoxWidget extends StatefulWidget {
  const CustomCheckBoxWidget({
    super.key,
  });

  @override
  State<CustomCheckBoxWidget> createState() => _CustomCheckBoxWidgetState();
}

class _CustomCheckBoxWidgetState extends State<CustomCheckBoxWidget> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      visualDensity: const VisualDensity(
        horizontal: -4.0,
      ),
      checkColor: kPrimaryColorDark,
      activeColor: kPrimaryColor,
      value: isChecked,
      onChanged: (value) {
        isChecked = value;
        setState(() {});
      },
    );
  }
}
