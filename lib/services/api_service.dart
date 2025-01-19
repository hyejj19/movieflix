import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieflix/models/movie_model.dart';

class ApiService {
  static const String baseUrl = 'https://movies-api.nomadcoders.workers.dev';
  static const String popular = 'popular';
  static const String nowPlaying = 'now-playing';
  static const String comingSoon = 'coming-soon';

  static Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> popularMovieInstances = [];
    final url = Uri.parse('$baseUrl/$popular');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final movies = jsonDecode(response.body)['results'];
      for (var movie in movies) {
        popularMovieInstances.add(MovieModel.fromJson(movie));
      }
      return popularMovieInstances;
    }

    throw Error();
  }

  static Future<List<MovieModel>> getNowInCinemas() async {
    List<MovieModel> nowInCenemasMovieInstances = [];
    final url = Uri.parse('$baseUrl/$nowPlaying');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final movies = jsonDecode(response.body)['results'];
      for (var movie in movies) {
        nowInCenemasMovieInstances.add(MovieModel.fromJson(movie));
      }
      return nowInCenemasMovieInstances;
    }

    throw Error();
  }

  static Future<List<MovieModel>> getComingSoon() async {
    List<MovieModel> comingSoonMovieInstances = [];
    final url = Uri.parse('$baseUrl/$comingSoon');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final movies = jsonDecode(response.body)['results'];
      for (var movie in movies) {
        comingSoonMovieInstances.add(MovieModel.fromJson(movie));
      }
      return comingSoonMovieInstances;
    }

    throw Error();
  }
}
