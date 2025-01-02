import 'package:flutter/material.dart';
import 'package:infoware_internshala/audio/AudioPLayer.dart';
import 'package:infoware_internshala/fetch_movie_repo.dart';
import 'package:infoware_internshala/form/FormValidationPage.dart';
import 'package:infoware_internshala/movie_page.dart';
import 'package:infoware_internshala/movie_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final fetch_movie_repo = FetchMovie();

  // run the app
  // runApp(MyApp(
  //   movieRepo: fetch_movie_repo,
  // ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // final MovieRepo movieRepo;
  // const MyApp({super.key, required this.movieRepo});
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Assignment Infoware',
      // home: MoviePage(movieRepo: movieRepo),
      // home: FormValidationPage(),
      home: AudioPlayerScreen(),
    );
  }
}
