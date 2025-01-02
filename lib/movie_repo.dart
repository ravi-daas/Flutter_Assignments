/*

Movie Repository

Here what the app can do 

this repo outlines what the app can do. Implemented in Data Layer

this repo is independent of any technology or framework

*/

import 'package:infoware_internshala/movie.dart';

abstract class MovieRepo {
  // get List of Movies

  Future<List<Movie>> getMovies();
}
