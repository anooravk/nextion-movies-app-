import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/moviesmodel.dart';

class FavoriteController extends GetxController {
  RxList<Movie> favoriteMovies = <Movie>[].obs;

  Future<void> toggleFavorite(Movie movie) async {
    if (isMovieFavorite(movie)) {
      favoriteMovies.remove(movie);
    } else {
      favoriteMovies.add(movie);
    }

    await saveFavoriteMovies();
  }

  bool isMovieFavorite(Movie movie) {
    return favoriteMovies.contains(movie);
  }

  Future<void> saveFavoriteMovies() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedFavorites = prefs.getStringList('favoriteMovies');

    await prefs.setStringList('favoriteMovies',
        favoriteMovies.map((movie) => jsonEncode(movie.toJson())).toList());
  }

  Future<void> loadFavoriteMovies() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedFavorites = prefs.getStringList('favoriteMovies');
    if (encodedFavorites != null) {
      try {
        favoriteMovies.value = encodedFavorites
            .map((json) => Movie.fromJson(jsonDecode(json)))
            .toList()
            .obs;
      } catch (e) {
        print('Error decoding JSON: $e');
        print('Problematic JSON data: $encodedFavorites');
      }
    }
  }

}
