import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Favorites extends StatefulWidget {
  static List<String> favorites = List<String>();
  @override
  _FavoritesState createState() => _FavoritesState(favorites);
}

class _FavoritesState extends State<Favorites> {
  List<String> favorites = List<String>();
  _FavoritesState(this.favorites);

  @override
  Widget build(BuildContext context) {
    print(favorites);
    return GridView.builder(
      padding: EdgeInsets.all(10),
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: favorites.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0
        ),
        itemBuilder: (context, int index){
          return FadeInImage.assetNetwork(
            placeholder: 'assets/giphy.gif',
            image: favorites[index],
            height: 200.0,
            width: 200.0,
            fit: BoxFit.cover,
          );
        }
    );
  }
}
