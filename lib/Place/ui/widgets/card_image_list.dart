import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/ui/widgets/card_image.dart';

class CardImageList extends StatelessWidget {
  const CardImageList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage(pathImage: "assets/img/beach_palm.jpeg"),
          CardImage(pathImage: "assets/img/mountain.jpeg"),
          CardImage(pathImage: "assets/img/mountain_stars.jpeg"),
          CardImage(pathImage: "assets/img/river.jpeg"),
          CardImage(pathImage: "assets/img/sunset.jpeg"),
        ],
      ),
    );
  }
}
