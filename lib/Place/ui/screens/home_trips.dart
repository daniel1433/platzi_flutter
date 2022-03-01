import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/ui/widgets/description_place.dart';
import 'package:platzi_trips_app/Place/ui/screens/header_appbar.dart';
import 'package:platzi_trips_app/Place/ui/widgets/review_list.dart';

class HomeTrips extends StatelessWidget {
  const HomeTrips(
      {Key? key,
      this.descriptionDummy =
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \n\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."});

  final String descriptionDummy;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            DescriptionPlace(
                namePlace: "Bahamas",
                stars: 4,
                descriptionPlace: descriptionDummy),
            ReviewList()
          ],
        ),
        HeaderAppBar()
      ],
    );
  }
}
