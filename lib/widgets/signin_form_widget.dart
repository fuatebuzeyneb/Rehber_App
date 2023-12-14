import 'package:travel_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:travel_app/views/auth_views/signup_view.dart';
import 'package:travel_app/views/home_view.dart';
import 'package:travel_app/widgets/helper/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/appbar/custom_appbar_widget.dart';
import '../../widgets/custom_buttom_widget.dart';
import '../../widgets/custom_text_field_widget.dart';
import '../../widgets/text/custom_title_text_widget.dart';

class SignInFormWidget extends StatefulWidget {
  const SignInFormWidget({
    super.key,
  });

  @override
  State<SignInFormWidget> createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends State<SignInFormWidget> {
  bool isLoading = false;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
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
                CustomButtonWidget(
                    title: isLoading == false
                        ? 'Sign In'
                        : 'isLoading Please wait',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});

                        BlocProvider.of<AuthCubit>(context)
                            .signInUserWithEmailAndPassword();
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
