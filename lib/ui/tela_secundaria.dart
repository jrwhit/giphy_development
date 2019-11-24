import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:share/share.dart';

class GifPage extends StatefulWidget {
  final Map _gifData;
  GifPage(this._gifData);
  @override
  _GifPageState createState() => _GifPageState(_gifData);
}

class _GifPageState extends State<GifPage> {
  final Map _gifData;
  var progress = "";
  bool downloading = false;
  _GifPageState(this._gifData);

  Future _download(String image) async{
    //Dio dio = Dio();

    //var dirToSave = await getApplicationDocumentsDirectory();
    //print(dirToSave.path);
    //ImageDownloader.downloadImage(image);
    try {
      // Saved with this method.
      var imageId = await ImageDownloader.downloadImage(image);
      if (imageId == null) {
        return;
      }

      // Below is a method of obtaining saved image information.
      var fileName = await ImageDownloader.findName(imageId);
      var path = await ImageDownloader.findPath(imageId);
      var size = await ImageDownloader.findByteSize(imageId);
      var mimeType = await ImageDownloader.findMimeType(imageId);
    } catch (error) {
      print(error);
    }
    /*await dio.download(image, "${dirToSave.path}/$name",
        onReceiveProgress: (rec, total){
            setState(() {
              downloading = true;
              print("start your s=downloading");
              progress = ((rec / total) * 100).toStringAsFixed(0)+"%";
              print(progress);
            });
        });
    try{}catch(e) {
      print("fail");
      throw (e);
    }
    setState(() {
      downloading = false;
      progress = "Downloading complete with sucess";
      print(progress);
    });*/
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size.width;
    var width = 0.7 * 5;
    print(_gifData);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Image.network(
              "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
          centerTitle: true,
        ),
        backgroundColor: Colors.white10,
        body: Column(
          children: <Widget>[
            Image.network(
              _gifData['images']['fixed_height']['url'],
              width: mediaQuery,
              height: 300,
              fit: BoxFit.contain,
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Image.network(
                    _gifData.containsKey("user")
                        ? _gifData['user']['avatar_url']
                        : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQr_HilBV_C5fDpAyY1M-VJmMlKuw4JZtd4gtajCXBGxqEUMtOKlQ&s",
                    width: width,
                    height: 10,
                  ),
                ),
                SizedBox(width: 4,),
                Container(
                  padding: EdgeInsets.all(6),
                  width: mediaQuery - 110,
                  height: 100.0,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      _gifData.containsKey("title")
                          ? Text(
                        _gifData['title'],
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )
                          : Text(""),
                      _gifData.containsKey("user")
                          ? Text(
                        _gifData['user']['username'],
                        style: TextStyle(color: Colors.black45),
                      )
                          : Text("Igor Noob!"),
                      _gifData.containsKey('import_datetime')
                          ? Text(_gifData['import_datetime'],
                          style: TextStyle(color: Colors.black45))
                          : Text('')
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            ButtonTheme(
              minWidth: mediaQuery,
              child: RaisedButton.icon(
                icon: Icon(Icons.share, color: Colors.white,),
                color: Colors.redAccent,
                label: Text("Compartilhar", style: TextStyle(color: Colors.white),),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)
                ),
                onPressed: (){
                  Share.share(_gifData['images']['fixed_height']['url']);
                },
              ),
            ),
            ButtonTheme(
              minWidth: mediaQuery,
              child: RaisedButton.icon(
                icon: Icon(Icons.system_update, color: Colors.white,),
                color: Colors.redAccent,
                label: Text("Download", style: TextStyle(color: Colors.white),),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0)
                ),
                onPressed: (){
                  _download(_gifData['images']['fixed_height']['url']);
                },
              ),
            ),
          ],
        )
    );
  }
}

