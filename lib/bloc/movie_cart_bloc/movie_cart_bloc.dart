import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_cart_bloc/movie_cart_state.dart';
import 'package:movie_app/bloc/movie_cart_bloc/movie_cart_events.dart';
import 'package:movie_app/modelview/movie_data_services.dart';

class MovieCartBloc extends Bloc<MovieCartEvents, MovieCartState> {
  final Set<String> _favIds = {};

  MovieCartBloc() : super(MovieCartStartState()) {
    on<ToggleFavoriteEvent>((event, emit) async {
      final movieId = event.movie.id;
      if (_favIds.contains(movieId)) {
        await MovieDataServices.addToFavorite(favoriteId: movieId);
        _favIds.remove(movieId);
        emit(AddedFavorite(movie: event.movie, favIds: Set.from(_favIds)));
      } else {
        emit(AddedFavorite(movie: event.movie, favIds: Set.from(_favIds)));

        _favIds.add(movieId);
        await MovieDataServices.addToFavorite(favoriteId: movieId);
      }
    });

    on<LoadingFavIds>((event, emit) async {
      final movies = event.movies;

      for (var e in movies) {
        if (e.isFavorite == true) {
          _favIds.add(e.id);
        }
        ;
      }

      emit(LoadingFavListState(favIds: _favIds));
    });
  }
}
