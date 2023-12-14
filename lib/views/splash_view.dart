import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/views/auth_views/signin_view.dart';
import 'package:travel_app/widgets/helper/consts.dart';
import 'package:travel_app/views/onboarding_view.dart';

import '../widgets/helper/cache_helper.dart';
import '../widgets/services/service_locator.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static String id = 'SplashView';
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      bool isOnBoardingVisited =
          getIt<CacheHelper>().getData(key: 'isOnBoardingVisited') ?? false;
      if (isOnBoardingVisited == true) {
        Navigator.pushReplacementNamed(context, SignInView.id);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.id);
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Text(
          'Rehber',
          style: GoogleFonts.pacifico(
            textStyle: const TextStyle(
                color: kPrimaryColorDark, letterSpacing: .5, fontSize: 50),
          ),
        ),
      ),
    );
  }
}
