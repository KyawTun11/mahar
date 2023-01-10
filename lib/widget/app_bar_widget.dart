import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mahar_code_test/search.dart';
import 'package:mahar_code_test/widget/search_widget.dart';



class MyAppBarWidget extends ConsumerWidget {
  const MyAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
              offset: Offset(1, 1),
              blurRadius: 2,
              color: Colors.grey,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 14),
                child: Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ),
                  );
                },
                child: const SearchWidget(
                  enabled: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
