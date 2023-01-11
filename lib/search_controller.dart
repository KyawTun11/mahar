import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mahar_code_test/service.dart';
import 'movie_model.dart';

// final searchProvider = StateNotifierProvider<SearchMovieController, List<Results>>((ref) {
//   return SearchMovieController();
// });
//
// class SearchMovieController extends StateNotifier<List<Results>> {
//   SearchMovieController(): super([]);
//   late List<Results?> movieResult = [];
//
//   filterMovies(String query) async {
//     final moviesList = await MovieService.getMovies();
//     final movies = moviesList!.results!
//         .where((element) =>
//             element.title!.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//     movieResult = movies;
//   }
// }
final searchProvider = ChangeNotifierProvider<SearchMovieController>(
  (ref) => SearchMovieController(),
);

class SearchMovieController extends ChangeNotifier {
  late List<Results?> movieResult = [];

  filterMovies(String query) async {
    final moviesList = await MovieService.getMovies();
    final movies = moviesList!.results!
        .where((element) =>
            element.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    movieResult = movies;
    notifyListeners();
  }
}


// final searchProvider = StateNotifierProvider<SearchMovieController,MovieModel>(
//       (ref) => SearchMovieController(ref),
// );
//
// class SearchMovieController extends StateNotifier<MovieModel> {
//   late List<Results?> movieResult;
//
//   SearchMovieController(super.state ,ref);
//
//   filterMovies(String query) async {
//     final moviesList = await MovieService.getMovies();
//     final movies = moviesList!.results!
//         .where((element) =>
//         element.title!.toLowerCase().contains(query.toLowerCase())).toList();
//     movieResult = movies;
//     // notifyListeners();
//   }
// }
