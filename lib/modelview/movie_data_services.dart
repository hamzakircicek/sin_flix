import 'dart:convert';

import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/modelview/client_service.dart';

class MovieDataServices {
  static Future<MovieModel?> getMovies({required int page}) async {
    final res = await ClientService.get(endPoint: 'movie/list?page=$page');
    if (res != null) {
      print(res);
      return MovieModelFromJson(res);
    }
    return null;
  }

  static Future<Movie?> addToFavorite({required String favoriteId}) async {
    final res = await ClientService.post(
      endPoint: 'movie/favorite/$favoriteId',
    );

    if (res != null) {
      print(jsonDecode(res)['data']['movie']);
      return Movie.fromJson(jsonDecode(res)['data']['movie']);
    }
    print(res);
    print('Hatalı istek');
    return null;
  }

  static Future<List<Movie>?> getFavoritedMovies() async {
    final res = await ClientService.get(endPoint: 'movie/favorites');

    if (res != null) {
      final data = jsonDecode(res)['data'] as List;
      final movies = data.map((e) => Movie.fromJson(e)).toList();
      return movies;
    }
    return null;
  }
}
