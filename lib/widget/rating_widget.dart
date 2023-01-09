import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  RatingBarWidget({Key? key, this.size = 16, this.rating, this.onRatingUpdate}) : super(key: key);
  double size;
  double? rating;
  Function(double )? onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: size,
      initialRating: rating ?? 0,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      ratingWidget: RatingWidget(
          full: const Icon(Icons.star, color: Colors.orange),
          half: const Icon(
            Icons.star_half,
            color: Colors.orange,
          ),
          empty: const Icon(
            Icons.star_outline,
            color: Colors.grey,
          )),
      onRatingUpdate:onRatingUpdate??(value){},
    );
  }
}