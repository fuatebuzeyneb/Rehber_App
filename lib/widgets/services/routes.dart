import 'package:flutter/material.dart';
import 'package:travel_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:travel_app/views/auth_views/signup_view.dart';
import 'package:travel_app/views/auth_views/signin_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/views/home_view.dart';
import 'package:travel_app/views/onboarding_view.dart';
import 'package:travel_app/views/splash_view.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  Homeview.id: (context) => const Homeview(),
  SplashView.id: (context) => const SplashView(),
  OnBoardingView.id: (context) => const OnBoardingView(),
  SignUpView.id: (context) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignUpView(),
      ),
  SignInView.id: (context) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const SignInView(),
      ),
};
