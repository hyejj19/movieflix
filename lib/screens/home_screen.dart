import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_service.dart';
import 'package:movieflix/widgets/card_with_title.dart';
import 'package:movieflix/widgets/popular_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> popularMovies = ApiService.getPopularMovies();

  final Future<List<MovieModel>> nowInCinemas = ApiService.getNowInCinemas();

  final Future<List<MovieModel>> comingSoon = ApiService.getComingSoon();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: FutureBuilder(
                future: popularMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Popular Movies',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                              child: makeListWithImg(
                            snapshot,
                          ))
                        ],
                      ),
                    );
                  }
                  return const Center(
                    heightFactor: 5,
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 320,
              child: FutureBuilder(
                future: nowInCinemas,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Now in Cinemas',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                              child: makeListWithTitleAndImg(
                                  snapshot, 'Now in Cinemas'))
                        ],
                      ),
                    );
                  }
                  return const Center(
                    heightFactor: 5,
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 320,
              child: FutureBuilder(
                future: comingSoon,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Coming soon',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                              child: makeListWithTitleAndImg(
                            snapshot,
                            'Coming soon',
                          ))
                        ],
                      ),
                    );
                  }
                  return const Center(
                    heightFactor: 5,
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView makeListWithImg(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return PopularCard(backdropPath: movie.backdropPath, id: movie.id);
      },
      separatorBuilder: (context, index) => SizedBox(
        width: 15,
      ),
    );
  }

  ListView makeListWithTitleAndImg(
    AsyncSnapshot<List<MovieModel>> snapshot,
    String sectionTitle,
  ) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return CardWithTitle(movie: movie, sectionTitle: sectionTitle);
      },
      separatorBuilder: (context, index) => SizedBox(
        width: 15,
      ),
    );
  }
}
