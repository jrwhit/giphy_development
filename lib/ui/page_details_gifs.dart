import 'package:flutter/material.dart';
import 'package:giphy_development/ui/gif_details.dart';
import 'package:giphy_development/ui/tabview/favorites.dart';
import 'package:giphy_development/ui/widgets/gifs_scroll.dart';

class PageDetaisDifs extends StatelessWidget {
  final Map _gifData;

  PageDetaisDifs(this._gifData);
  @override
  Widget build(BuildContext context) {
    print(_gifData['images']['fixed_height']['url']);
    return Scaffold(
      appBar: AppBar(
        elevation: 8.0,
        title: Text(
          "Details Gifs",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {
            Favorites.favorites.add(_gifData['images']['fixed_height']['url']);
          })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DetailsPage(_gifData),
            SizedBox(
              height: 20.0,
            ),
            GifScroll(),
          ],
        ),
      ),
    );
  }
}
