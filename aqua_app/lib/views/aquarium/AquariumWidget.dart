import 'package:aqua_app/models/Fish.dart';
import 'package:aqua_app/observer/AquariumAnalizer.dart';
import 'package:aqua_app/views/aquarium/FishWidget.dart';
import 'package:aqua_app/constants/Settings.dart';
import 'package:flutter/material.dart';


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
            onTap: (){
              if (!Settings.KILL_FISH_ON_TAP){
                return;
              }

              analyzer?.killFish(f);
            },
          )
      );
    });
    return res;
  }

}
