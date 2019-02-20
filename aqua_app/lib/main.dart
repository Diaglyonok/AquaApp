import 'package:aqua_app/AquaScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        accentColor: Colors.cyanAccent,
        primarySwatch: Colors.cyan, 
      ),
      home: new AquaScreen(),
    );
  }
}

