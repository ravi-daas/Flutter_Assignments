/*

Search Repo 

THis implements the movie repo and handles fetching from the api. 

*/

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:infoware_internshala/movie.dart';
import 'package:infoware_internshala/movie_repo.dart';

class FetchMovie  implements MovieRepo{
  @override
  Future<List<Movie>> getMovies() async {
    final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
    
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the data
      List<dynamic> moviesData = json.decode(response.body);
      
      // Map the response to a list of Movie objects
      return moviesData.map((data) {
        final movieData = data['show'];
        return Movie(
          title: movieData['name'],
          summary: movieData['summary'] ?? 'No Summary',
          rating: movieData['rating']['average']?.toString(),
          image: movieData['image']?['medium'],
        );
      }).toList();
    } else {
      // If the server did not return a 200 response, throw an exception
      throw Exception('Failed to load movies');
    }
  }

}