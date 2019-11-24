import 'package:flutter/material.dart';
import 'package:giphy_development/ui/tela_principal.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    appBarTheme: AppBarTheme(
      color: Color(0xff212F3D),
    )
  ),
  home: MyHomePage(),
));