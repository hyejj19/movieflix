class MovieDetailModel {
  final int id, runtime;
  final num voteAverage;
  final bool adult;
  final String backdropPath, overview, originalTitle, title, posterPath;
  final List<dynamic> genres;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        backdropPath = json['backdrop_path'],
        originalTitle = json['original_title'],
        title = json['original_title'],
        overview = json['overview'],
        runtime = json['runtime'],
        voteAverage = json['vote_average'],
        posterPath = json['poster_path'],
        adult = json['adult'],
        genres = json['genres'];
}
