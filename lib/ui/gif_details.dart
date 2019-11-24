import 'package:flutter/material.dart';
import 'package:giphy_development/ui/widgets/avatar_information.dart';
import 'package:giphy_development/ui/widgets/avatar_poster.dart';

class DetailsPage extends StatefulWidget {
  final Map _gifData;
  DetailsPage(this._gifData);
  @override
  _DetailsPageState createState() => _DetailsPageState(_gifData);
}

class _DetailsPageState extends State<DetailsPage> {
  final Map _gifData;
  _DetailsPageState(this._gifData);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size.width;
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 140),
          child: Image.network(
            _gifData['images']['fixed_height']['url'],
            width: mediaQuery,
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.white, width: 2.0)
                    )
                ),
                child:  _gifData.containsKey("user")
                    ? AvatarPoster(_gifData['user']['avatar_url'], 140.0)
                    : AvatarPoster("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr_HilBV_C5fDpAyY1M-VJmMlKuw4JZtd4gtajCXBGxqEUMtOKlQ&s", 140.0),
              ),
              SizedBox(width: 16,),
              Expanded(
                child: AvatarInformation(
                    _gifData.containsKey("title") ? _gifData['title'] : "hello my baby",
                    _gifData.containsKey('user') ? _gifData['user']['username'] : "Vazio",
                    _gifData
                ),
              ),

            ],
          ),
        ),
      ],

    );
  }
}
