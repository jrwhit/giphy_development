import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:share/share.dart';

import 'avatar_buttons_actions.dart';

class LikesIsDislikes extends StatelessWidget {
  final Map _gifData;
  var progress = "";
  bool downloading = false;

  LikesIsDislikes(this._gifData);

  Future _download(String image) async{
    try{
      var imageId = await ImageDownloader.downloadImage(image);
      if(imageId == null){
        return print("Impossivel realizar o login, teste de novo");
      }else{
        var fileName = await ImageDownloader.findName(imageId);
        var path = await ImageDownloader.findPath(imageId);
        var size = await ImageDownloader.findByteSize(imageId);
        var mimeType = await ImageDownloader.findMimeType(imageId);
      }
    }catch (e){
      SocketException(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //ButtonActions(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.file_download, color: Colors.black54,),
                onPressed: (){
                  _download(_gifData['images']['fixed_height']['url']);
                },
              ),
              Text("Download", style: TextStyle(color: Colors.black54))
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.share, color: Colors.black54,),
                  onPressed: (){
                    Share.share(_gifData['images']['fixed_height']['url']);
                  }
              ),
              Text("Share", style: TextStyle(color: Colors.black54),)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.thumb_up, color: Colors.black54,), onPressed: (){}
              ),
              Text("1112", style: TextStyle(color: Colors.black54),)
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.thumb_down, color: Colors.black54,), onPressed: (){},
              ),
              Text("199", style: TextStyle(color: Colors.black54),)
            ],
          ),
        ],
      ),
    );
  }
}
