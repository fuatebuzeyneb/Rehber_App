import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/model/historical_characters_model.dart';
import 'package:travel_app/widgets/custom_characters_card_widget.dart';

class ListViewCharactersCardWidget extends StatelessWidget {
  const ListViewCharactersCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.width * 0.45,
      child: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance
              .collection('historical_characters')
              .get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
              return const Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              List<HistoricalCharacters> historicalCharactersList = [];
              for (int i = 0; i < snapshot.data!.docs.length; i++) {
                historicalCharactersList
                    .add(HistoricalCharacters.fromJson(snapshot.data!.docs[i]));
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomCharactersCardWidget(
                    historicalCharacters: historicalCharactersList[index],
                  );
                },
              );
            }

            return const Text("loading");
          }),
    );
  }
}
/*


*/
