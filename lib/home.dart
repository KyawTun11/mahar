import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mahar_code_test/controller.dart';
import 'package:mahar_code_test/widget/app_bar_widget.dart';
import 'package:mahar_code_test/widget/loading_widget.dart';
import 'package:mahar_code_test/widget/rating_widget.dart';

import 'detail.dart';

final controller = ChangeNotifierProvider((ref) => Controller());

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    ref.read(controller).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var read = ref.read(controller);
    var watch = ref.watch(controller);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: MyAppBarWidget(),
      ),
      body: LoadingWidget(
        isLoading: watch.isLoading,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: watch.movieResult.length,
                        itemBuilder: (context, index) {
                          var items = watch.movieResult[index]!;
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                      movieResult: items,
                                    ),
                                  ),
                                );
                              },
                              child: Image.network(
                                  "https://image.tmdb.org/t/p/w500${items.backdropPath}"),
                            ),
                          );
                        }),
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 2 / 4,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: watch.movieResult.length,
                      itemBuilder: (BuildContext ctx, index) {
                        var items = watch.movieResult[index]!;
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
                          child: Column(
                            children: [
                              Image.network(
                                  "https://image.tmdb.org/t/p/w500${items.posterPath}"),
                              const SizedBox(height: 4),
                              RatingBarWidget(
                                rating: items.voteAverage!,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                items.title!,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
