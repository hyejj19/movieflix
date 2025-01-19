import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/screens/detail_screen.dart';

class CardWithTitle extends StatelessWidget {
  final String? sectionTitle;

  const CardWithTitle({
    super.key,
    required this.movie,
    this.sectionTitle,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                id: movie.id,
                imgUrl: movie.backdropPath,
                sectionTitle: sectionTitle ?? 'Movie Detail',
              ),
            ));
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
