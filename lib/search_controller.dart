import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mahar_code_test/service.dart';
import 'movie_model.dart';

final searchProvider = StateNotifierProvider<SearchMovieController, List<Results>>((ref)
  => SearchMovieController(),
);

class SearchMovieController extends StateNotifier<List<Results>>{
  SearchMovieController(): super([]);
  bool? isLoading;
  List<Results?> movieResult = [];

  filterMovies(String query) async {
    isLoading = true;
    final moviesList = await MovieService.getMovies();
  if(query.isEmpty){
    isLoading = true;
  }else{
    final movies = movieResult.where((element) =>
        element!.title!.toLowerCase().contains(query.toLowerCase()));
    isLoading = false;
  }
  }
}