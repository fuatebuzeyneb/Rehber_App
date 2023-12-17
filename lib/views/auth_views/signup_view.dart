import 'package:flutter/material.dart';
import 'package:travel_app/widgets/signup_form_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static String id = 'SignUpView';

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SignUpFormWidget(),
      ),
    );
  }
}
