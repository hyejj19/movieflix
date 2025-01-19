import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_service.dart';
import 'package:movieflix/widgets/popular_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> popularMovies = ApiService.getPopularMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Popular Movies',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder(
                  future: popularMovies,
                  builder: (context, result) {
                    if (result.hasData) {
                      return ListView.separated(
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
                      );
                    }

                    return CircularProgressIndicator();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
