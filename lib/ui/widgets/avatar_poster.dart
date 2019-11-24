import 'package:flutter/material.dart';

class AvatarPoster extends StatelessWidget {
  static const aspect_ratio = 0.7;
  String posterUrl;
  double posterHeight;

  AvatarPoster(this.posterUrl, this.posterHeight);
  @override
  Widget build(BuildContext context) {
    var width = aspect_ratio * posterHeight;
    return Material(
      borderRadius: BorderRadius.circular(18.0),
      elevation: 8.0,
      shadowColor: Colors.black,
      child: Image.network(posterUrl, width: width, height: posterHeight,),
    );
  }
}
