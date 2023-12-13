import 'package:flutter/material.dart';

import 'package:travel_app/views/home_view.dart';
import 'package:travel_app/views/onboarding_view.dart';
import 'package:travel_app/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Homeview.id: (context) => const Homeview(),
        SplashView.id: (context) => const SplashView(),
        OnBoardingView.id: (context) => const OnBoardingView(),
      },
      initialRoute: SplashView.id,
    );
  }
}
