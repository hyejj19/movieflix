import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/widgets/popular_card.dart';

class PopularCardList extends StatelessWidget {
  const PopularCardList({
    super.key,
    required this.popularMovies,
  });

  final Future<List<MovieModel>> popularMovies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Popular Movies',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        FutureBuilder(
            future: popularMovies,
            builder: (context, result) {
              if (result.hasData) {
                return Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: result.data!.length,
                    itemBuilder: (context, index) {
                      var movie = result.data![index];
                      return PopularCard(
                          backdropPath: movie.backdropPath, id: movie.id);
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      width: 20,
                    ),
                  ),
                );
              }
              return Center(
                  heightFactor: 5, child: CircularProgressIndicator());
            }),
      ],
    );
  }
}
