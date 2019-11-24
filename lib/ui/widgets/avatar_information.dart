import 'package:flutter/material.dart';

import 'avatar_actions.dart';

class AvatarInformation extends StatelessWidget {
  final String _title;
  final String _autor;
  final Map _gifData;
  AvatarInformation(this._title, this._autor, this._gifData);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(_title, style: textTheme.title, maxLines: 1,),
        Text("User: $_autor", style: textTheme.caption,),
        LikesIsDislikes(_gifData),
      ],
    );
  }
}
