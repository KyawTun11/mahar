import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mahar_code_test/date_fomater.dart';
import 'package:mahar_code_test/home.dart';
import 'package:mahar_code_test/widget/rating_widget.dart';
import 'movie_model.dart';

class DetailPage extends ConsumerWidget {
  const DetailPage({
    Key? key,
    required this.movieResult,
  }) : super(key: key);
  final Results movieResult;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieResult.title!),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            movieResult.posterPath == null
                ? const Text("Not found image")
                : Image.network(
                    "https://image.tmdb.org/t/p/w500${movieResult.backdropPath}"),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    movieResult.originalTitle!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  dateFormat(movieResult.releaseDate!),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${movieResult.voteCount!}"),
                RatingBarWidget(
                  rating: movieResult.voteAverage!,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Genre"),
                Text("${movieResult.genreIds!.first}"),
              ],
            ),
            const SizedBox(height: 8),
            const Text("Over View"),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                movieResult.posterPath == null
                    ? const Text("Not found image")
                    : Image.network(
                        "https://image.tmdb.org/t/p/w500${movieResult.posterPath}",
                        width: 120,
                      ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    movieResult.overview!,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
