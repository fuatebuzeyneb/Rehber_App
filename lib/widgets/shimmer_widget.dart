import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.45,
          height: double.infinity,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.3),
            highlightColor: Colors.white.withOpacity(0.5),
            child: const Card(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: size.width * 0.5,
          height: double.infinity,
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.3),
            highlightColor: Colors.white.withOpacity(0.5),
            child: const Card(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
