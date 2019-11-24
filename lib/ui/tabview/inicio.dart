import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giphy_development/services/api_conn.dart';
import 'package:share/share.dart';

import '../page_details_gifs.dart';

class Inicio extends StatefulWidget {
  @override
  _inicio createState() => _inicio();
}

class _inicio extends State<Inicio> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: "Pesquisa",
                hintText: "Digite o gif",
                labelStyle: TextStyle(color: Colors.redAccent, fontSize: 12),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
            style: TextStyle(color: Colors.black, fontSize: 18),
            textAlign: TextAlign.start,
            onSubmitted: (text) {
              setState(() {
                GifsDevelopermentService.search = text;
                GifsDevelopermentService.offset = 0;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "Trending Now",
                style: textTheme.caption.copyWith(fontSize: 18.0),
              ),
            ),
          ],
        ),
        Divider(),
        Expanded(
          child: FutureBuilder(
              future: GifsDevelopermentService.getSearch(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Container(
                      width: 200.0,
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.black87),
                        strokeWidth: 5.0,
                      ),
                    );
                  default:
                    if (snapshot.hasError)
                      return Container();
                    else
                      return _createGridGif(context, snapshot);
                }
              }),
        ),
      ],
    );
  }
  int _getCount(List data) {
    if (GifsDevelopermentService.search == null) {
      return data.length;
    } else {
      return data.length + 1;
    }
  }

  Widget _createGridGif(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: _getCount(snapshot.data['data']),
      // ignore: missing_return
      itemBuilder: (context, index) {
        if (GifsDevelopermentService.search == null ||
            index < snapshot.data['data'].length) {
          return GestureDetector(
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/giphy.gif',
              image: snapshot.data['data'][index]['images']['fixed_height']
              ['url'],
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
            ),
            onTap: () =>
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) =>
                          PageDetaisDifs(snapshot.data['data'][index]),
                      /*GifPage(snapshot.data['data'][index]),*/
                    )),
            onLongPress: () {
              Share.share(snapshot.data['data'][index]['images']['fixed_height']
              ['url']);
            },
          );
        } else {
          return Container(
            child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 50.0,
                  ),
                  Text(
                    "Carregar mais",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              onTap: () {
                setState(() {
                  GifsDevelopermentService.offset += 19;
                });
              },
            ),
          );
        }
      },
    );
  }
}
