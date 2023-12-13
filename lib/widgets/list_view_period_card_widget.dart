import 'package:flutter/material.dart';
import 'package:travel_app/widgets/custom_period_card_widget.dart';

class ListViewPeriodCardWidget extends StatelessWidget {
  const ListViewPeriodCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: (size.width * 0.3),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.only(right: 6),
            child: CustomPeriodCardWidget(),
          );
        },
      ),
    );
  }
}
