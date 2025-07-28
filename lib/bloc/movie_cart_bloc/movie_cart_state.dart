import 'package:movie_app/model/movie_model.dart';

abstract class MovieCartState {}

class MovieCartStartState extends MovieCartState {}

class AddedFavorite extends MovieCartState {
  final Movie movie;
  final Set<String> favIds;
  AddedFavorite({required this.movie, required this.favIds});
}

class LoadingFavListState extends MovieCartState {
  final Set<String> favIds;
  LoadingFavListState({required this.favIds});
}
