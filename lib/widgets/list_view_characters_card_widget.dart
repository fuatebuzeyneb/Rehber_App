import 'package:flutter/material.dart';
import 'package:travel_app/widgets/custom_characters_card_widget.dart';

class ListViewCharactersCardWidget extends StatelessWidget {
  const ListViewCharactersCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const CustomCharactersCardWidget();
        },
      ),
    );
  }
}
