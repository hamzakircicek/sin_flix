import 'package:flutter/material.dart';
import 'package:movie_app/bloc/profie_bloc/profile_bloc.dart';
import 'package:movie_app/bloc/profie_bloc/profile_events.dart';
import 'package:movie_app/bloc/profie_bloc/profile_state.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/view/widgets/circular_progress_widget.dart';
import 'package:movie_app/view/widgets/profile_infoes_widget.dart';
import 'package:movie_app/view/widgets/rectangle_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view/widgets/ui_helpers.dart';

class Profile extends StatefulWidget {
  final PageController? pageController;
  const Profile({super.key, this.pageController});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    if (mounted) {
      context.read<ProfileBloc>().add(LoadFavList());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(5.0),
              child: RectangleButton(
                height: 30,
                width: 30,
                customPadding: 15,
                radious: BorderRadius.circular(35),
                assetPath: 'assets/Arrow---Left.png',
                function: () {
                  if (widget.pageController != null) {
                    widget.pageController!.animateToPage(
                      0,
                      duration: Duration(milliseconds: 150),
                      curve: Curves.ease,
                    );
                  }
                },
              ),
            ),
            title: _appBarTitle(),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child:
                state is ProfileLoaded
                    ? ProfileInfoesWidget(
                      movies: state.favoritedMovies ?? [],
                      photoUrl: state.photoUrl ?? '',
                      function: () async {
                        await Navigator.pushNamed(
                          context,
                          '/add_profile_photo',
                        );
                      },
                    )
                    : Center(child: CircularProgressWidget()),
          ),
        );
      },
    );
  }

  _appBarTitle() {
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text('Profil Detayı'),
        SizedBox(
          height: 30,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 10),
            ),
            onPressed: () {
              UiHelpers.showModal(context);
            },
            child: Row(
              spacing: 5,
              children: [
                Image.asset('assets/Offers.png'),
                Text('Sınırlı Teklif', style: thinTextStyle),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
