import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/bloc/movie_cart_bloc/movie_cart_bloc.dart';
import 'package:movie_app/bloc/movie_cart_bloc/movie_cart_events.dart';
import 'package:movie_app/bloc/movie_cart_bloc/movie_cart_state.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/view/widgets/rectangle_buttons.dart';
import 'package:transparent_image/transparent_image.dart';

class MovieCart extends StatefulWidget {
  final Movie movie;

  const MovieCart({super.key, required this.movie});

  @override
  State<MovieCart> createState() => _MovieCartState();
}

class _MovieCartState extends State<MovieCart> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MovieCartBloc, MovieCartState, bool>(
      selector: (state) {
        if (state is AddedFavorite) {
          return state.favIds.contains(widget.movie.id);
        }
        return widget.movie.isFavorite;
      },
      builder: (context, isFavorite) {
        return Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: widget.movie.poster.replaceAll('http:', 'https:'),
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.transparent],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.movie.title, style: boldTextStyle),

                            _buildExpandableText(widget.movie.plot),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              right: 10,
              bottom: 100,
              child: RectangleButton(
                imageColor: isFavorite ? Colors.red : null,
                width: 40,
                customPadding: 9,
                assetPath: 'assets/Favorite.png',
                function: () {
                  context.read<MovieCartBloc>().add(
                    ToggleFavoriteEvent(movie: widget.movie),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildExpandableText(String text) {
    const int cutoff = 100;
    final bool showExpandButton = text.length > cutoff;
    final String visibleText =
        showExpandButton && !isExpanded ? text.substring(0, cutoff) : text;

    return Text.rich(
      TextSpan(
        text: visibleText,
        style: TextStyle(color: Colors.white, fontSize: 13),
        children:
            showExpandButton
                ? [
                  TextSpan(
                    text: isExpanded ? ' Gizle' : '... Devamını oku',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer:
                        TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                  ),
                ]
                : [],
      ),
    );
  }
}
