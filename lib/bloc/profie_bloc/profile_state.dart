import 'dart:io';

import 'package:movie_app/model/movie_model.dart';

abstract class ProfileState {}

class StartProfileImagePage extends ProfileState {}

class LoadingImage extends ProfileState {}

class LoadedImage extends ProfileState {
  final String photoUrl;
  LoadedImage(this.photoUrl);
}

class ImagePreview extends ProfileState {
  final File? imageFile;
  ImagePreview({this.imageFile});
}

class LoadImageError extends ProfileState {
  final String message;
  LoadImageError(this.message);
}

class LoadedFavList extends ProfileState {
  final List<Movie> favoritedMovies;
  LoadedFavList({required this.favoritedMovies});
}

class LoadingFavList extends ProfileState {}

class LoadingFavListError extends ProfileState {
  final String message;
  LoadingFavListError(this.message);
}

class ProfileLoaded extends ProfileState {
  final String? photoUrl;
  final List<Movie>? favoritedMovies;

  ProfileLoaded({this.photoUrl, this.favoritedMovies});
}
