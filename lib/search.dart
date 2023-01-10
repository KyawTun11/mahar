import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mahar_code_test/widget/loading_widget.dart';
import 'package:mahar_code_test/widget/search_widget.dart';

import 'controller.dart';

final controller = ChangeNotifierProvider((ref) => Controller());

class SearchPage extends ConsumerWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = TextEditingController();
    var read = ref.read(controller);
    var watch = ref.watch(controller);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            LoadingWidget(
              isLoading: watch.isLoading,
              child: ListView.builder(
                  itemCount: watch.movieResult.length,
                  itemBuilder: (context, index) {
                    var items = watch.movieResult[index]!;
                return ListTile(
                  leading: Image.network(
                      "https://image.tmdb.org/t/p/w500${items.posterPath}"
                  ),
                  title: Text(items.title!),
                );
              }),
            ),
            Positioned(
              top: 12,
              left: 16,
              right: 16,
              child: SearchWidget(
                enabled: true,
                controller: searchController,
                onSubmitted: (value) async {
                  await read.searchMovie(value);
                  searchController.clear();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
