import 'package:flutter/material.dart';

import 'package:travel_app/consts.dart';
import 'package:travel_app/widgets/appbar/custom_appbar_home_widget.dart';
import 'package:travel_app/widgets/list_view_characters_card_widget.dart';
import 'package:travel_app/widgets/list_view_period_card_widget.dart';
import 'package:travel_app/widgets/text/custom_title_text_widget.dart';

class Homeview extends StatelessWidget {
  const Homeview({super.key});
  static String id = 'Homeview';
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: CustomAppBarHomeWidget(),
        drawer: Drawer(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomTitleTextWidget(title: 'Historical Periods'),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              ListViewPeriodCardWidget(),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  CustomTitleTextWidget(title: 'Historical Periods'),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              ListViewCharactersCardWidget(),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  CustomTitleTextWidget(title: 'Historical Periods'),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              ListViewCharactersCardWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
