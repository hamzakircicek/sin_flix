import 'package:movie_app/model/movie_model.dart';

abstract class MainPageState {}

class Loading extends MainPageState {}

class Loaded extends MainPageState {
  final List<Movie> movies;
  Loaded(this.movies);
}

class LoadingError extends MainPageState {
  final String message;
  LoadingError(this.message);
}

class LoadingMorePageState extends MainPageState {}

class AddMorePageState extends MainPageState {
  final List<Movie> movies;
  AddMorePageState(this.movies);
}

class LoadedMorePage extends MainPageState {
  final List<Movie> movies;
  LoadedMorePage(this.movies);
}

class LoadingErrorMorePageState extends MainPageState {
  final String message;
  LoadingErrorMorePageState(this.message);
}
