import 'package:flutter/material.dart';
import 'package:travel_app/widgets/helper/consts.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.label,
    this.onChanged,
  });
  final String label;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return 'field is required';
          } else if (label == 'Email Address' && !data.contains('@')) {
            return '@@@@@@@';
          } else if (label == 'Password' && data.length <= 6) {
            return 'The password must be 6 letters and numbers or more';
          }
          return null;
        },
        onChanged: onChanged,
        cursorColor: kPrimaryColorDark,
        decoration: InputDecoration(
          label: Text(
            label,
            style: const TextStyle(color: kPrimaryColorDark),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColorDark),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColorDark),
          ),
        ),
      ),
    );
  }
}
