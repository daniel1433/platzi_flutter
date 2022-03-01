import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/ui/widgets/review.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review(
            pathImage: "assets/img/people.jpg",
            name: "Varuna Yasas",
            details: "1 review · 5 photos",
            comment: "There is an amazing place in Sri Lanka"),
        Review(
            pathImage: "assets/img/ann.jpg",
            name: "Anahí Salgado",
            details: "2 review · 5 photos",
            comment: "There is an amazing place in Sri Lanka"),
        Review(
            pathImage: "assets/img/girl.jpg",
            name: "Gissele Thomas",
            details: "2 review · 2 photos",
            comment: "There is an amazing place in Sri Lanka"),
      ],
    );
  }
}
