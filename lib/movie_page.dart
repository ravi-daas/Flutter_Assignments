// Movie Page: Provide Cubit to VIew(UI)
// usiing Bloc Provider

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoware_internshala/movie_cubit.dart';
import 'package:infoware_internshala/movie_repo.dart';
import 'package:infoware_internshala/movie_view.dart';

class MoviePage extends StatelessWidget {
  final MovieRepo movieRepo;

  const MoviePage({super.key, required this.movieRepo});

  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    return BlocProvider(
      create: (context) => MovieCubit(movieRepo),
      child: const MovieView(),
    );
  }
}
