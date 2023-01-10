import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mahar_code_test/movie_model.dart';
import 'package:mahar_code_test/search_controller.dart';
import 'package:mahar_code_test/widget/rating_widget.dart';
import 'package:mahar_code_test/widget/search_widget.dart';
import 'detail.dart';
import 'home.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Results?> searchList = ref.watch(searchProvider.notifier).movieResult;
    var searchController = TextEditingController();
    var watch = ref.watch(controller);
    return Scaffold(
      appBar: AppBar(
        title: SearchWidget(
          enabled: true,
          controller: searchController,
          onSubmitted: (value) async {
             await ref.watch(searchProvider.notifier).filterMovies(value);
            searchController.clear();
          },
        ),
      ),
      body: SafeArea(
        child: searchList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: searchList.length,
                itemBuilder: (context, index) {
                  var items = searchList[index]!;
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            movieResult: items,
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      leading: Image.network(
                          "https://image.tmdb.org/t/p/w500${items.posterPath}"),
                      title: Text(items.title!),
                      subtitle: Text("Vote Count ${items.voteCount!}"),
                      trailing: RatingBarWidget(
                        rating: items.voteAverage!,
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
