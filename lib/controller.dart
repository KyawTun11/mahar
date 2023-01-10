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

   searchMovie(String query) async {
    if(query.isEmpty){
      Text("Error");
      isLoading = false;
      notifyListeners();
    }else{
      movieResult.where((element) =>
          element!.title!.toLowerCase().contains(query.toLowerCase()));
      isLoading = true;
      notifyListeners();
    }
  }
}
