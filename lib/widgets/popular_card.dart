import 'package:flutter/material.dart';
import 'package:movieflix/screens/detail_screen.dart';

class PopularCard extends StatelessWidget {
  final String backdropPath;
  final int id;

  const PopularCard({
    super.key,
    required this.backdropPath,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                id: id,
                imgUrl: backdropPath,
                sectionTitle: 'Popular Movies',
              ),
            ));
      },
      child: Column(children: [
        Container(
          width: 300,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Image.network(
            backdropPath,
          ),
        ),
      ]),
    );
    ;
  }
}
