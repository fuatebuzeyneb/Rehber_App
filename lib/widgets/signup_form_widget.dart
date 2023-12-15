import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:travel_app/views/home_view.dart';
import 'package:travel_app/widgets/custom_check_box_widget.dart';
import 'package:travel_app/widgets/helper/consts.dart';
import 'package:travel_app/views/auth_views/signin_view.dart';
import 'package:travel_app/widgets/appbar/custom_appbar_widget.dart';
import 'package:travel_app/widgets/custom_buttom_widget.dart';
import 'package:travel_app/widgets/custom_text_field_widget.dart';
import 'package:travel_app/widgets/services/functions/toast_msg.dart';
import 'package:travel_app/widgets/text/custom_title_text_widget.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          toastMsg(errorMsg: 'An account has been created');
          Navigator.pushReplacementNamed(context, Homeview.id);
        } else if (state is AuthFailure) {
          toastMsg(errorMsg: state.errorMsg);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: authCubit.formKeyForSignUp,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.12,
                  ),
                  const CustomAppBarWidget(
                    title: 'Welcome !',
                    fontSize: 32,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  CustomTextFieldWidget(
                    onChanged: (value) {
                      authCubit.name = value;
                    },
                    label: 'First Name',
                  ),
                  CustomTextFieldWidget(
                    onChanged: (value) {
                      authCubit.lastName = value;
                    },
                    label: 'Last Name',
                  ),
                  CustomTextFieldWidget(
                    onChanged: (value) {
                      authCubit.email = value;
                    },
                    label: 'Email Address',
                  ),
                  CustomTextFieldWidget(
                    suffixIcon: IconButton(
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context)
                            .obscurePasswordText();
                      },
                      icon: authCubit.obscurePasswordTextValue == false
                          ? const Icon(
                              Icons.visibility_off,
                              color: kPrimaryColor,
                            )
                          : const Icon(
                              Icons.visibility,
                              color: kPrimaryColor,
                            ),
                    ),
                    onChanged: (value) {
                      authCubit.password = value;
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
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  state is AuthLoading
                      ? const CircularProgressIndicator()
                      : CustomButtonWidget(
                          title: 'Sign Up',
                          onTap: () {
                            if (authCubit.formKeyForSignUp.currentState!
                                    .validate() &&
                                authCubit.termsAndConditionCheckVox == true) {
                              BlocProvider.of<AuthCubit>(context)
                                  .signUpUserWithEmailAndPassword();
                            } else {
                              toastMsg(
                                  errorMsg:
                                      'You must agree to the terms and condition');
                            }
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
