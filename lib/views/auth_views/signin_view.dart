import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/widgets/helper/consts.dart';
import 'package:travel_app/widgets/signin_form_widget.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static String id = 'SignInView';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.35,
                color: kPrimaryColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Rehber',
                      style: GoogleFonts.pacifico(
                        textStyle: const TextStyle(
                            color: Colors.white,
                            letterSpacing: .5,
                            fontSize: 50),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          kSignInImage1,
                          width: (size.height * 0.35) / 2.5,
                          height: (size.height * 0.35) / 2.5,
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          kSignInImage2,
                          width: (size.height * 0.35) / 2.5,
                          height: (size.height * 0.35) / 2.5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SignInFormWidget()
            ],
          ),
        ),
      ),
    );
  }
}
