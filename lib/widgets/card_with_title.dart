import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';

class CardWithTitle extends StatelessWidget {
  const CardWithTitle({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('눌렸당 ㅋㅋ');
      },
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Image.network(
              movie.backdropPath,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Flexible(
            child: SizedBox(
              width: 150,
              child: Text(
                movie.title,
                softWrap: true,
                maxLines: 3,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
