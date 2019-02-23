import 'package:aqua_app/AquariumAnalizer.dart';
import 'package:aqua_app/Fish.dart';
import 'package:aqua_app/FishWidget.dart';
import 'package:flutter/material.dart';
import 'dart:math';


class AquariumWidget extends AnimatedWidget{


  AnimationController controller;

  static Animation<double> _getAnimation(AnimationController controller){
    return new Tween(begin: -200.0, end: 25.0).animate(controller);
  }

  List<Fish> allFish;
  AquariumAnalyzer analyzer;
  Size maxSize;

  AquariumWidget( {
    Key key,
    @required this.controller,
    @required this.allFish,
    @required this.maxSize,
  }) : assert(controller != null),
        super(key: key, listenable: _getAnimation(controller)){
    analyzer = AquariumAnalyzer(allFish);
  }

  Animation<double> get animation => listenable;

  @override
  Widget build(BuildContext context) {

    allFish = analyzer.checkAll(maxSize);

    return Stack(
      children: getFishWidgetList(),
    );

  }

  List<Widget> getFishWidgetList() {
    List<Widget> res = [];

    allFish.forEach((f) {
      res.add(
          FishWidget(
            curFish: f,
          )
      );
    });
    return res;
  }

}
