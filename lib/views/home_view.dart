import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubits/home_cubit/home_cubit.dart';

import 'package:travel_app/widgets/helper/consts.dart';
import 'package:travel_app/widgets/appbar/custom_appbar_home_widget.dart';
import 'package:travel_app/widgets/list_view_characters_card_widget.dart';
import 'package:travel_app/widgets/list_view_period_card_widget.dart';
import 'package:travel_app/widgets/text/custom_title_text_widget.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});
  static String id = 'Homeview';

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  void initState() {
    HomeCubit homeCubit = BlocProvider.of<HomeCubit>(context);
    homeCubit.getPeriodsInFirebase();
    homeCubit.getCharactersInFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: CustomAppBarHomeWidget(),
        drawer: Drawer(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
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
                    CustomTitleTextWidget(title: 'Historical Characters'),
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
      ),
    );
  }
}
