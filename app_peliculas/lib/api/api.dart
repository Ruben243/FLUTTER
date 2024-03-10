import 'package:app_peliculas/constants.dart';
import 'package:app_peliculas/models/movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static const _valoradasUrl =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}";
  static const _topPopularesUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}";
  static const _proximasUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}";

  Future<List<Movie>> getValoradas() async {
    final response = await http.get(Uri.parse(_valoradasUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Algo fue mal");
    }
  }

  Future<List<Movie>> getPopulares() async {
    final response = await http.get(Uri.parse(_topPopularesUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Algo fue mal");
    }
  }

  Future<List<Movie>> getProximas() async {
    final response = await http.get(Uri.parse(_proximasUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Algo fue mal");
    }
  }
}
