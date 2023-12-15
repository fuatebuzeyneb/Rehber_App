import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/widgets/helper/consts.dart';

import '../cubits/auth_cubit/auth_cubit.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    super.key,
    required this.label,
    this.onChanged,
    this.suffixIcon,
  });
  final String label;
  final Function(String)? onChanged;

  final IconButton? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return 'field is required';
          } else if (label == 'Email Address' && !data.contains('@')) {
            return 'The email must contain @';
          } else if (label == 'Password' && data.length <= 6) {
            return 'The password must be 6 letters and numbers or more';
          }
          return null;
        },
        onChanged: onChanged,
        obscureText: label == 'Password'
            ? BlocProvider.of<AuthCubit>(context).obscurePasswordTextValue!
            : false,
        cursorColor: kPrimaryColorDark,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
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
