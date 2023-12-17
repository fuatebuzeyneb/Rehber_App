import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:travel_app/views/auth_views/signin_view.dart';
import 'package:travel_app/widgets/appbar/custom_appbar_widget.dart';
import 'package:travel_app/widgets/custom_buttom_widget.dart';
import 'package:travel_app/widgets/custom_text_field_widget.dart';
import 'package:travel_app/widgets/helper/consts.dart';
import 'package:travel_app/widgets/services/functions/toast_msg.dart';
import 'package:travel_app/widgets/text/custom_subtitle_text_widget.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static String id = 'ForgotPasswordView';
  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          toastMsg(
              errorMsg:
                  'A link message has been sent to your email for change password');
          Navigator.pushReplacementNamed(context, SignInView.id);
        } else if (state is ForgotPasswordFailure) {
          toastMsg(errorMsg: state.errorMsg);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Form(
                  key: authCubit.formKeyForForgotPassword,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.08,
                      ),
                      const CustomAppBarWidget(
                        title: 'Forgot Password',
                        fontSize: 26,
                      ),
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                      Image.asset(
                        kForgotPassword,
                        height: 220,
                        width: 220,
                      ),
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                      const CustomSubTitleTextWidget(
                        title:
                            'Enter your registered email below to receive password reset instruction',
                        fontSize: 14,
                        color: kPrimaryColor,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      CustomTextFieldWidget(
                        onChanged: (value) {
                          BlocProvider.of<AuthCubit>(context).email = value;
                        },
                        label: 'Email Address',
                      ),
                      SizedBox(
                        height: size.height * 0.15,
                      ),
                      state is ForgotPasswordLoading
                          ? const CircularProgressIndicator()
                          : CustomButtonWidget(
                              title: 'Send Reset Password Link',
                              onTap: () async {
                                if (authCubit
                                    .formKeyForForgotPassword.currentState!
                                    .validate()) {
                                  await authCubit
                                      .sendLinkToEmailForForgotPassword();
                                } else {}
                              }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
