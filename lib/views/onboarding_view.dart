import 'package:flutter/material.dart';
import 'package:travel_app/widgets/helper/consts.dart';
import 'package:travel_app/model/onboarding_model/onboarding_model.dart';
import 'package:travel_app/views/auth_views/signup_view.dart';
import 'package:travel_app/views/auth_views/signin_view.dart';
import 'package:travel_app/views/home_view.dart';
import 'package:travel_app/widgets/custom_buttom_widget.dart';
import 'package:travel_app/widgets/services/functions/on_boarding_visited_fun.dart';
import 'package:travel_app/widgets/text/custom_subtitle_text_widget.dart';
import 'package:travel_app/widgets/text/custom_title_text_widget.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});
  static String id = 'OnBoardingView';
  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemCount: onboardingContact.length,
                    itemBuilder: (_, i) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  OnBoardingVisitedFun();
                                  Navigator.pushReplacementNamed(
                                      context, Homeview.id);
                                },
                                child: CustomSubTitleTextWidget(
                                    title: currentIndex ==
                                            onboardingContact.length - 1
                                        ? ''
                                        : 'Skip'),
                              ),
                            ],
                          ),
                          Image.asset(
                            onboardingContact[i].image,
                            height: 300,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(onboardingContact.length,
                                  (index) => buildDot(index, context)),
                            ),
                          ),
                          CustomTitleTextWidget(
                            title: onboardingContact[i].title,
                            fontSize: 30,
                          ),
                          CustomSubTitleTextWidget(
                            title: onboardingContact[i].subTitle,
                            fontSize: 16,
                          ),
                        ],
                      );
                    }),
              ),
              CustomButtonWidget(
                  onTap: () {
                    if (currentIndex == onboardingContact.length - 1) {
                      OnBoardingVisitedFun();
                      Navigator.pushReplacementNamed(context, SignUpView.id);
                    } else {
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    }
                  },
                  title: currentIndex == onboardingContact.length - 1
                      ? 'Create Account'
                      : 'Next'),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  OnBoardingVisitedFun();
                  Navigator.pushReplacementNamed(context, SignInView.id);
                },
                child: Text(
                  currentIndex == onboardingContact.length - 1
                      ? 'Login Now'
                      : '',
                  style: const TextStyle(
                      decoration: TextDecoration.underline, color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 10,
      width: currentIndex == index ? 25 : 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? kPrimaryColorDark : kPrimaryColor,
      ),
    );
  }
}
