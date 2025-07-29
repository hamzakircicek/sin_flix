import 'package:flutter/material.dart';
import 'package:movie_app/bloc/main_page_bloc/main_page_bloc.dart';
import 'package:movie_app/bloc/main_page_bloc/main_page_events.dart';
import 'package:movie_app/bloc/main_page_bloc/main_page_state.dart';

import 'package:movie_app/view/widgets/movie_cart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimeLine extends StatefulWidget {
  const TimeLine({super.key});

  @override
  State<TimeLine> createState() => _TimeLineState();
}

class _TimeLineState extends State<TimeLine> {
  late PageController controller;
  int activePage = 1;
  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageBloc, MainPageState>(
      builder: (context, state) => _getMoviesList(state, context),
    );
  }

  Widget _getMoviesList(MainPageState state, BuildContext context) {
    if (state is Loaded) {
      return PageView.builder(
        controller: controller,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (i) {
          activePage = i + 1;

          if ((i + 1) % 5 == 0) {
            context.read<MainPageBloc>().add(
              AddMorePageEvent(((i + 1) / 5).floor() + 1),
            );
          }
        },

        itemCount: state.movies.length,
        itemBuilder:
            (BuildContext ctx, int i) => MovieCart(movie: state.movies[i]),
      );
    } else if (state is LoadingMorePageState) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return const SizedBox();
    }
  }
}
