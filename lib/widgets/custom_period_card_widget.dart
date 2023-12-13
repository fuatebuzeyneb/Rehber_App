import 'package:flutter/material.dart';

class CustomPeriodCardWidget extends StatelessWidget {
  const CustomPeriodCardWidget({super.key});

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
                child: const Text(
                  textAlign: TextAlign.center,
                  'Selahaddin Eyyubi El Kurdi',
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
                  'https://upload.wikimedia.org/wikipedia/commons/c/cc/Selahaddin_Eyyubi_El_Kurdi.jpg',
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
