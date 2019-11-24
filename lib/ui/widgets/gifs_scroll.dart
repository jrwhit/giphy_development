import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:giphy_development/services/api_conn.dart';

import '../page_details_gifs.dart';

class GifScroll extends StatelessWidget {


  Widget _createListGif(BuildContext context, AsyncSnapshot snapshot) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 8.0, left: 20.0),
      scrollDirection: Axis.horizontal,
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: snapshot.data['data'].length,
      // ignore: missing_return
      itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 16),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: GestureDetector(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/giphy.gif',
                  image: snapshot.data['data'][index]['images']['fixed_height']['url'],
                  height: 160.0, width: 120.0, fit: BoxFit.cover,
                ),
                onTap: ()=> Navigator.push(context, CupertinoPageRoute(
                  builder: (context) => PageDetaisDifs(snapshot.data['data'][index]),
                  /*GifPage(snapshot.data['data'][index]),*/
                )),
              ),
            ),
          );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("+ Gifs", style: textTheme.caption.copyWith(fontSize: 18.0),),
        ),
        SizedBox.fromSize(
          size: const Size.fromHeight(120.0),
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
                      return _createListGif(context, snapshot);
                }
              }),
        )
      ],
    );
  }
}
