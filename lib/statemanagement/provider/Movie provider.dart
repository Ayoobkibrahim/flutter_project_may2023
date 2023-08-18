import 'dart:math';
import 'package:flutter/cupertino.dart';
import '../model/Movies.dart';

final List<Movie> movieList = List.generate(50,
        (index) => Movie(title: "Movie$index",
    time: "${Random().nextInt(50)+30} minutes"));

class MovieProvider extends ChangeNotifier{
  final List<Movie> _movies = movieList;
  List<Movie> get movies => _movies;

  final List<Movie> _whishlist =[];
  List<Movie> get whismovie => _whishlist;

  void addToList(Movie moviefromMAin){
    _whishlist.add(moviefromMAin);
    notifyListeners();
  }
  void removeFromList(Movie removedMovie){
    _whishlist.remove(removedMovie);
  }

}