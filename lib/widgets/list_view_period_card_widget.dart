import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/model/historical_periodes_model.dart';
import 'package:travel_app/widgets/custom_period_card_widget.dart';
import 'package:travel_app/widgets/shimmer_widget.dart';

class ListViewPeriodCardWidget extends StatelessWidget {
  const ListViewPeriodCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: (size.width * 0.3),
      child: FutureBuilder<QuerySnapshot>(
          future:
              FirebaseFirestore.instance.collection('historical_periods').get(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
              return const Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              List<HistoricalPeriodsModel> historicalPeriodsList = [];
              for (int i = 0; i < snapshot.data!.docs.length; i++) {
                historicalPeriodsList.add(
                    HistoricalPeriodsModel.fromJson(snapshot.data!.docs[i]));
              }
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: CustomPeriodCardWidget(
                      historicalPeriodsModel: historicalPeriodsList[index],
                    ),
                  );
                },
              );
            }
            return const ShimmerWidget();
          }),
    );
  }
}
