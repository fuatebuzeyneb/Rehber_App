import 'package:flutter/material.dart';

class CustomCharactersCardWidget extends StatelessWidget {
  const CustomCharactersCardWidget({super.key});

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
                  'https://cdnb.artstation.com/p/assets/images/images/028/911/163/large/mohamed-sax-saladin.jpg?1595889577',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Text(
                'Selahaddin',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
