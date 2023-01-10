import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mahar_code_test/service.dart';
import 'movie_model.dart';

final searchProvider = ChangeNotifierProvider<SearchMovieController>(
  (ref) => SearchMovieController(),
);

class SearchMovieController extends ChangeNotifier {
  //SearchMovieController(): super([]);
  bool? isLoading;
  late List<Results?> movieResult = [];

  filterMovies(String query) async {
    isLoading = true;
    final moviesList = await MovieService.getMovies();
    final movies = movieResult.where((element) =>
        element!.title!.toLowerCase().contains(query.toLowerCase())).toList();
    notifyListeners();
    return movies;
  }
}
