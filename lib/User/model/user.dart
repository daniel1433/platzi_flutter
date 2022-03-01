import 'package:flutter/material.dart';

class User {
  final String photoURL;
  final String name;
  final String email;

  User(
      {Key? key,
      required this.email,
      required this.photoURL,
      required this.name});
}
