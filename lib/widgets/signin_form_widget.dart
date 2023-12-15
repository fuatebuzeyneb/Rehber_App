import 'package:travel_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:travel_app/views/auth_views/signup_view.dart';
import 'package:travel_app/views/home_view.dart';
import 'package:travel_app/widgets/helper/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/widgets/services/functions/toast_msg.dart';
import '../../widgets/appbar/custom_appbar_widget.dart';
import '../../widgets/custom_buttom_widget.dart';
import '../../widgets/custom_text_field_widget.dart';
import '../../widgets/text/custom_title_text_widget.dart';

class SignInFormWidget extends StatelessWidget {
  const SignInFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacementNamed(context, Homeview.id);
        } else if (state is AuthFailure) {
          toastMsg(errorMsg: state.errorMsg);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: authCubit.formKeyForSignIn,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const CustomAppBarWidget(
                  title: 'Welcome Back !',
                  fontSize: 26,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFieldWidget(
                  onChanged: (value) {
                    BlocProvider.of<AuthCubit>(context).email = value;
                  },
                  label: 'Email Address',
                ),
                CustomTextFieldWidget(
                  suffixIcon: IconButton(
                      onPressed: () {
                        authCubit.obscurePasswordText();
                      },
                      icon: authCubit.obscurePasswordTextValue == true
                          ? const Icon(
                              Icons.visibility,
                              color: kPrimaryColor,
                            )
                          : const Icon(
                              Icons.visibility_off,
                              color: kPrimaryColor,
                            )),
                  onChanged: (value) {
                    BlocProvider.of<AuthCubit>(context).password = value;
                  },
                  label: 'Password',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTitleTextWidget(
                      title: 'Forget Password?',
                      color: kPrimaryColorDark,
                      fontSize: 14,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.16,
                ),
                state is AuthLoading
                    ? const CircularProgressIndicator()
                    : CustomButtonWidget(
                        title: 'Sign In',
                        onTap: () {
                          if (authCubit.formKeyForSignIn.currentState!
                              .validate()) {
                            BlocProvider.of<AuthCubit>(context)
                                .signInUserWithEmailAndPassword();
                          } else {}
                        }),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomTitleTextWidget(
                      title: 'Don\'t have an account? ',
                      fontSize: 12,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, SignUpView.id);
                      },
                      child: const CustomTitleTextWidget(
                        title: 'Sign Up',
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
