import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travel_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:travel_app/views/home_view.dart';
import 'package:travel_app/widgets/custom_check_box_widget.dart';
import 'package:travel_app/widgets/helper/consts.dart';
import 'package:travel_app/views/auth_views/signin_view.dart';
import 'package:travel_app/widgets/appbar/custom_appbar_widget.dart';
import 'package:travel_app/widgets/custom_buttom_widget.dart';
import 'package:travel_app/widgets/custom_text_field_widget.dart';
import 'package:travel_app/widgets/text/custom_title_text_widget.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: const CircularProgressIndicator(
            color: kPrimaryColor,
          ),
          color: kPrimaryColorDark,
          inAsyncCall: isLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  const CustomAppBarWidget(
                    title: 'Welcome !',
                    fontSize: 32,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  CustomTextFieldWidget(
                    onChanged: (value) {
                      BlocProvider.of<AuthCubit>(context).name = value;
                    },
                    label: 'First Name',
                  ),
                  CustomTextFieldWidget(
                    onChanged: (value) {
                      BlocProvider.of<AuthCubit>(context).lastName = value;
                    },
                    label: 'Last Name',
                  ),
                  CustomTextFieldWidget(
                    onChanged: (value) {
                      BlocProvider.of<AuthCubit>(context).email = value;
                    },
                    label: 'Email Address',
                  ),
                  CustomTextFieldWidget(
                    onChanged: (value) {
                      BlocProvider.of<AuthCubit>(context).password = value;
                    },
                    label: 'Password',
                  ),
                  Row(
                    children: [
                      const CustomCheckBoxWidget(),
                      const CustomTitleTextWidget(
                        title: 'I have agree to our ',
                        fontSize: 12,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Terms and condition',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 12,
                              color: kPrimaryColor),
                        ),
                      )
                    ],
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  CustomButtonWidget(
                      title: 'Sign Up',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});

                          BlocProvider.of<AuthCubit>(context)
                              .signUpUserWithEmailAndPassword();
                          Navigator.pushReplacementNamed(context, Homeview.id);

                          isLoading = false;
                          setState(() {});
                        } else {}
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomTitleTextWidget(
                        title: 'Already have an account? ',
                        fontSize: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, SignInView.id);
                        },
                        child: const CustomTitleTextWidget(
                          title: 'Sign In',
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
