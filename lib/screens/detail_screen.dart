import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/services/api_service.dart';

class DetailScreen extends StatefulWidget {
  final int id;
  final String imgUrl;
  final String sectionTitle;

  const DetailScreen({
    super.key,
    required this.id,
    required this.imgUrl,
    required this.sectionTitle,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetailModel> movieDetail;

  @override
  void initState() {
    super.initState();
    movieDetail = ApiService.getMovieDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    ApiService.getMovieDetail(33);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(widget.sectionTitle)),
      body: Stack(children: [
        Container(
          height: double.infinity,
        ),
        Positioned.fill(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.imgUrl),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black54,
                  BlendMode.darken,
                ),
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: FutureBuilder(
              future: movieDetail,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var movie = snapshot.data!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 120,
                        width: double.infinity,
                      ),
                      Text(
                        movie.title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // 텍스트 색상
                        ),
                      ),
                      Text(
                        'Rate: ${movie.voteAverage}',
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.white, // 텍스트 색상
                        ),
                      ),
                      SizedBox(
                        height: 120,
                      ),
                      Text(
                        'Storyline',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.white, // 텍스트 색상
                        ),
                      ),
                      Text(
                        movie.overview,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          // 텍스트 색상
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        'Tags:',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold // 텍스트 색상
                            ),
                      ),
                      Text(
                        movie.genres.map((genre) => genre['name']).join(', '),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  );
                }

                return Center(
                  heightFactor: 20,
                  child: CircularProgressIndicator(),
                );
                ;
              },
            ),
          ),
        ),
      ]),
    );
  }
}
