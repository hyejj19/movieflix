import 'package:flutter/material.dart';

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
        print('눌렸당 ㅋㅋ');
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
