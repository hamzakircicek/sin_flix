import 'package:flutter/material.dart';
import 'package:movie_app/bloc/main_page_bloc/main_page_bloc.dart';
import 'package:movie_app/bloc/movie_cart_bloc/movie_cart_bloc.dart';
import 'package:movie_app/bloc/profie_bloc/profile_bloc.dart';
import 'package:movie_app/theme.dart';
import 'package:movie_app/view/pages/add_profile_photo_page.dart';

import 'package:movie_app/view/pages/login_page.dart';
import 'package:movie_app/view/pages/main_page.dart';
import 'package:movie_app/view/pages/profile_page.dart';
import 'package:movie_app/view/pages/register_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(Duration(milliseconds: 500));
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<MainPageBloc>(create: (context) => MainPageBloc()),
        BlocProvider<ProfileBloc>(create: (context) => ProfileBloc()),
        BlocProvider<MovieCartBloc>(create: (context) => MovieCartBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/main_page': (context) => MainPage(),
        '/profile_detail': (context) => const Profile(),
        '/add_profile_photo': (context) => AddProfilePhotoPage(),
      },
      theme: darkTheme,
    );
  }
}
