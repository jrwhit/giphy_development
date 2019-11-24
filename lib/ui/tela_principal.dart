import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giphy_development/services/api_conn.dart';
import 'package:giphy_development/ui/page_details_gifs.dart';
import 'package:giphy_development/ui/tabview/favorites.dart';
import 'package:giphy_development/ui/tabview/inicio.dart';
import 'package:share/share.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 8.0,
          title: Image.network(
              "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: <Widget>[
            Inicio(),
            Favorites(),
          ],
        ),
        bottomNavigationBar: TabBar(
          unselectedLabelColor: Color(0xffD24732),
          indicatorColor: Color(0xff212F3D),
          labelColor: Color(0xff212F3D),
          isScrollable: true,
          tabs: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Tab(text: 'Home', icon: Icon(Icons.home))),
            Padding(
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Tab(text: 'Favorites', icon: Icon(Icons.favorite))),
          ],
        ),
      ),
    );
  }
}
