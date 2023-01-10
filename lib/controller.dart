import 'package:flutter/cupertino.dart';
import 'package:mahar_code_test/service.dart';
import 'movie_model.dart';

class Controller extends ChangeNotifier {
  bool? isLoading;
  List<Results?> movieResult = [];

  void getData() {
    MovieService.getMovies().then((value) {
      if (value != null) {
        movieResult = value.results!;
        isLoading = true;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
    });
  }
}
