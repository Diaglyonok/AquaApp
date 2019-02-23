import 'package:aqua_app/AquaScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);

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

