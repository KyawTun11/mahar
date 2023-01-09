import 'dart:convert';
import 'package:http/http.dart';
import 'movie_model.dart';
import 'package:http/http.dart' as http;

class MovieService {
  static Future<MovieModel?> getMovies() async {
    String url = "https://api.themoviedb.org/3/movie/top_rated?api_key=a646f606a7ea96c27ecbce8eb6b5d6fe";
    try {
     Response response = await get(Uri.parse(url));
      if (response != null) {
        return MovieModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
