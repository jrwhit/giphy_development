import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("first swiper"),
      ),
      body: Swiper(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index){
          return new Image.network("http://via.placeholder.com/350x150", fit: BoxFit.fill);
        },
        pagination: SwiperPagination(),
        control: SwiperControl(),
        autoplay: true,
        duration: 800,
        viewportFraction: 0.8,
        scale: 0.9,
      ),
    );
  }
}
