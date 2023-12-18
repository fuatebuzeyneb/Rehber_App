import 'package:flutter/material.dart';
import 'package:travel_app/model/historical_characters_model.dart';

class CustomCharactersCardWidget extends StatelessWidget {
  const CustomCharactersCardWidget(
      {super.key, required this.historicalCharacters});
  final HistoricalCharacters historicalCharacters;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: size.width * 0.8,
        width: size.width * 0.22,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FractionallySizedBox(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Image.network(
                  historicalCharacters.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                historicalCharacters.name,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
