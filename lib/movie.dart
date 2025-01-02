/*

 This is what a Movie object is 

 Properties
-title
-summary
-image
-rating

Method
-search


*/

import 'package:flutter/material.dart';
import 'package:infoware_internshala/details_screen.dart';

class Movie {
  final String title;
  final String summary;
  final String? rating;
  final String? image;

  Movie({required this.title, required this.summary, this.rating, this.image});

  Movie Search() {
    return Movie(title: title, summary: summary, rating: rating, image: image);
  }

  void navigateToDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DetailsScreen(movie: this)),
    );
  }
}
