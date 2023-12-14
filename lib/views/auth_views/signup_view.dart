import 'package:flutter/material.dart';
import 'package:travel_app/widgets/signup_form_widget.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  static String id = 'SignUpView';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SignUpFormWidget(),
      ),
    );
  }
}
