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
      await Future.delayed(Duration(seconds: 1));
      try {
        final movieList = await MovieDataServices.getMovies(page: event.page);
        if (movieList != null) {
          movies.clear();
          movies.addAll(movieList.data.movies);
          emit(Loaded(List.from(movies), false));
        }
      } catch (e) {
        emit(LoadingError('Bir hata oluştu: ${e.toString()}'));
      }
    });

    on<AddMorePageEvent>((event, emit) async {
      try {
        print('fonksiyona girdikk');
        final movieList = await MovieDataServices.getMovies(page: event.page);
        print(event.page);
        print('gelen pageee');
        if (movieList != null &&
            movieList.data.movies.isNotEmpty &&
            _fetchMovies) {
          print('if bloguna girdikk');

          if (event.topIndex == 1) {
            _fetchMovies = true;
          }

          if (movieList.data.movies.length < 5) {
            _fetchMovies = false;
          }
          emit(Loaded(List.from(movies), true));
          movies.addAll(movieList.data.movies);
          await Future.delayed(Duration(seconds: 2));
          emit(Loaded(List.from(movies), false));
        }
      } catch (e) {
        emit(LoadingErrorMorePageState('Bir hata oluştu: ${e.toString()}'));
      }
    });
  }
}
