/*

Each cubit is a list of movies

*/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoware_internshala/movie.dart';
import 'package:infoware_internshala/movie_repo.dart';

class MovieCubit extends Cubit<List<Movie>> {
  // reference Movie repo
  final MovieRepo movieRepo;

  MovieCubit(this.movieRepo) : super([]){
    fetchMovies();
  }

  //  Fetch 

  Future<void> fetchMovies() async{
    // fetch list of movies from Repo
    final movieList = await movieRepo.getMovies();

    // emit the fetched list as the new state 
    emit(movieList);
  }
}