import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/profie_bloc/profile_events.dart';
import 'package:movie_app/bloc/profie_bloc/profile_state.dart';
import 'package:movie_app/model/user_profile_model.dart';
import 'package:movie_app/modelview/add_profile_photo_services.dart';
import 'package:movie_app/modelview/movie_data_services.dart';

class ProfileBloc extends Bloc<ProfileEvents, ProfileState> {
  ProfileBloc() : super(StartProfileImagePage()) {
    on<LoadImage>((event, emit) async {
      emit(LoadingImage());
      try {
        UserModel? user = await AddProfilePhotoServices.sendImage(
          event.imageFile!,
        );
        if (user != null) {
          final res = await MovieDataServices.getFavoritedMovies();
          emit(ProfileLoaded(photoUrl: user.photoUrl, favoritedMovies: res));
        }
      } catch (e) {
        emit(LoadImageError('Bir hata oluştu: ${e.toString()}'));
      }
    });

    on<LoadImagePreviewEvent>((event, emit) async {
      emit(ImagePreview(imageFile: event.imageFile));
    });

    on<LoadFavList>((event, emit) async {
      emit(LoadingFavList());
      try {
        final res = await MovieDataServices.getFavoritedMovies();
        ProfileLoaded oldState =
            state is ProfileLoaded ? state as ProfileLoaded : ProfileLoaded();
        emit(ProfileLoaded(photoUrl: oldState.photoUrl, favoritedMovies: res));
      } catch (e) {
        emit(LoadingFavListError('Bir hata oluştu: ${e.toString()}'));
      }
    });
  }
}
