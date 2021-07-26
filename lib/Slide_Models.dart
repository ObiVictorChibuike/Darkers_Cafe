import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;

  Slide({
    @required this.imageUrl,
    @required this.title,
  });
}

final slideList = [
  Slide(
    imageUrl: 'assets/pics1fg.jpg',
    title: 'TASTE IT,\nLOVE IT',
  ),

  Slide(
    imageUrl: 'assets/pics2fg.jpg',
    title: 'HOME OF YOUR\nBEST CHOICE',
  ),

  Slide(
    imageUrl: 'assets/pics3fg.jpg',
    title: 'BEST FOOD\nBEST SERVICE',
  ),
];
