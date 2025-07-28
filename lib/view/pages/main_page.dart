import 'package:flutter/material.dart';
import 'package:movie_app/bloc/main_page_bloc/main_page_bloc.dart';
import 'package:movie_app/bloc/main_page_bloc/main_page_events.dart';
import 'package:movie_app/bloc/main_page_bloc/main_page_state.dart';
import 'package:movie_app/bloc/movie_cart_bloc/movie_cart_bloc.dart';
import 'package:movie_app/bloc/movie_cart_bloc/movie_cart_events.dart';

import 'package:movie_app/view/pages/profile_page.dart';
import 'package:movie_app/view/widgets/bottom_navbar.dart';
import 'package:movie_app/view/widgets/circular_progress_widget.dart';
import 'package:movie_app/view/widgets/timeline.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget>? widgets;

  late PageController controller;
  bool _isRefreshing = false;
  @override
  void initState() {
    controller = PageController();
    if (mounted) {
      context.read<MainPageBloc>().add(LoadMovies(1));
    }
    super.initState();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _isRefreshing = true;
    });
    context.read<MainPageBloc>().add(LoadMovies(1));
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      _isRefreshing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavbar(pageController: controller),
      body: BlocBuilder<MainPageBloc, MainPageState>(
        builder: (context, state) {
          return getWidget(state);
        },
      ),
    );
  }

  Widget getWidget(Object? state) {
    if (state is Loading) {
      return CircularProgressWidget();
    } else if (state is Loaded) {
      context.read<MovieCartBloc>().add(LoadingFavIds(movies: state.movies));
      widgets = [TimeLine(), Profile(pageController: controller)];
      return RefreshIndicator(
        onRefresh: () async {
          if (controller.page!.floor() == 1) {
            print('Yenilendii');
          }
        },
        child: PageView.builder(
          controller: controller,
          onPageChanged: (i) async {},
          physics: NeverScrollableScrollPhysics(),
          itemCount: widgets!.length,
          itemBuilder: (BuildContext ctx, int i) => widgets![i],
        ),
      );
    } else if (state is LoadingError) {
      return SizedBox();
    } else {
      return SizedBox();
    }
  }
}
