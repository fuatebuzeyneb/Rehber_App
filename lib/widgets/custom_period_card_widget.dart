import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_app/model/historical_periodes_model.dart';

class CustomPeriodCardWidget extends StatelessWidget {
  const CustomPeriodCardWidget(
      {super.key, required this.historicalPeriodsModel});
  final HistoricalPeriodsModel historicalPeriodsModel;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.47,
      height: size.width * 0.27,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Row(
            children: [
              SizedBox(
                width: size.width * 0.2,
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
                child: SizedBox(
                  height: size.width * 0.3,
                  width: size.width * 0.16,
                  child: CachedNetworkImage(
                    imageUrl: historicalPeriodsModel.image,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(0.3),
                      highlightColor: Colors.white.withOpacity(0.5),
                      child: Container(
                        height: size.width * 0.3,
                        width: size.width * 0.16,
                        color: Colors.grey,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
