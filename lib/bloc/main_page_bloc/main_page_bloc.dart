import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/main_page_bloc/main_page_events.dart';
import 'package:movie_app/bloc/main_page_bloc/main_page_state.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/modelview/movie_data_services.dart';

class MainPageBloc extends Bloc<MainPageEvents, MainPageState> {
  List<Movie> movies = [];
  bool _fetchMovies = true;

  MainPageBloc() : super(Loading()) {
    on<LoadMovies>((event, emit) async {
      emit(Loading());
      try {
        final movieList = await MovieDataServices.getMovies(page: event.page);
        if (movieList != null) {
          movies.addAll(movieList.data.movies);
          emit(Loaded(List.from(movies)));
        }
      } catch (e) {
        emit(LoadingError('Bir hata oluştu: ${e.toString()}'));
      }
    });

    on<AddMorePageEvent>((event, emit) async {
      try {
        final movieList = await MovieDataServices.getMovies(page: event.page);
        if (movieList != null &&
            movieList.data.movies.isNotEmpty &&
            _fetchMovies) {
          if (movieList.data.movies.length < 5) {
            _fetchMovies = false;
          }
          movies.addAll(movieList.data.movies);
          emit(Loaded(List.from(movies)));
        }
      } catch (e) {
        print('Hata var ');
        emit(LoadingErrorMorePageState('Bir hata oluştu: ${e.toString()}'));
      }
    });
  }
}
