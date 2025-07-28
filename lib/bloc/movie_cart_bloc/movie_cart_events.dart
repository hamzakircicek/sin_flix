import 'package:movie_app/model/movie_model.dart';

abstract class MovieCartEvents {}

class ToggleFavoriteEvent extends MovieCartEvents {
  final Movie movie;

  ToggleFavoriteEvent({required this.movie});
}

class LoadingFavIds extends MovieCartEvents {
  final List<Movie> movies;

  LoadingFavIds({required this.movies});
}
