import 'package:flutter/material.dart';
import 'package:travel_app/model/historical_periodes_model.dart';

class CustomPeriodCardWidget extends StatelessWidget {
  const CustomPeriodCardWidget(
      {super.key, required this.historicalPeriodsModel});
  final HistoricalPeriodsModel historicalPeriodsModel;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.5,
      height: double.infinity,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.22,
                child: Text(
                  textAlign: TextAlign.center,
                  historicalPeriodsModel.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  historicalPeriodsModel.image,
                  height: size.width * 0.3,
                  width: size.width * 0.18,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
