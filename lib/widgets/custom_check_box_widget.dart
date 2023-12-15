import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubits/auth_cubit/auth_cubit.dart';
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
        BlocProvider.of<AuthCubit>(context)
            .updateTermsAndConditionCheckVox(newValue: value);
      },
    );
  }
}
