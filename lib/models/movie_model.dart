class MovieModel {
  final bool adult;
  final String backdropPath,
      originalLanguage,
      originalTitle,
      overview,
      posterPath,
      title,
      releaseDate;
  final dynamic popularity, voteAverage;
  final int id;
  final int voteCount;
  final List<dynamic> genreIds;
  final bool video;

  static const imgPrefix = 'https://image.tmdb.org/t/p/w500';

  MovieModel.fromJson(Map<String, dynamic> json)
      : adult = json['adult'],
        backdropPath = '$imgPrefix${json['backdrop_path']}',
        genreIds = json['genre_ids'],
        id = json['id'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'],
        posterPath = '$imgPrefix${json['poster_path']}',
        releaseDate = json['release_date'],
        title = json['title'],
        video = json['video'],
        voteAverage = json['vote_average'],
        voteCount = json['vote_count'];
}
