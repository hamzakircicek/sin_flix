import 'package:flutter/material.dart';
import 'package:movie_app/bloc/main_page_bloc/main_page_bloc.dart';
import 'package:movie_app/bloc/main_page_bloc/main_page_events.dart';
import 'package:movie_app/bloc/main_page_bloc/main_page_state.dart';
import 'package:movie_app/view/widgets/circular_progress_widget.dart';
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
  int topIndex = 1;
  @override
  void initState() {
    super.initState();
    controller = PageController();
    controller.addListener(() {
      if (controller.offset < -180) {
        activePage = 1;
        topIndex = 1;
        print('topindexx');
        print(topIndex);
        context.read<MainPageBloc>().add(LoadMovies(1));
      }
    });
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
      return Stack(
        children: [
          PageView.builder(
            controller: controller,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (i) {
              if (i > topIndex) {
                topIndex = i;
                print(topIndex);
                print(i);
              }
              activePage = i + 1;
              if ((activePage) % 5 == 0 && i == topIndex) {
                print('data cekiliyorr');
                context.read<MainPageBloc>().add(
                  AddMorePageEvent(((i + 1) / 5).floor() + 1, topIndex),
                );
              }
            },

            itemCount: state.movies.length,
            itemBuilder:
                (BuildContext ctx, int i) => MovieCart(movie: state.movies[i]),
          ),

          if (state.moveMovieLoading)
            Align(
              alignment: Alignment.bottomCenter,
              child: CircularProgressWidget(),
            ),
        ],
      );
    } else if (state is LoadingMorePageState) {
      print('state is morepage');
      return const Center(child: CircularProgressWidget());
    } else if (state is Loading) {
      print('state is loadeinng');
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Center(child: CircularProgressWidget()),
      );
    } else {
      print('state is unknown');
      return const SizedBox();
    }
  }
}
