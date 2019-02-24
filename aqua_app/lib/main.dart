import 'package:aqua_app/views/aquarium/AquaScreen.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Aquarium App',
      theme: new ThemeData(
        accentColor: Colors.teal,
        primarySwatch: Colors.cyan, 
      ),
      home: new AquaScreen(),
    );
  }
}

