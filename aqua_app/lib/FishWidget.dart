import 'package:aqua_app/Fish.dart';
import 'package:flutter/material.dart';

class AnimatedFishWidget extends AnimatedWidget{

  static const Duration DEFAULT_DURATION = const Duration(days: 1);
  AnimationController controller;

  static Animation<double> _getAnimation(AnimationController controller){
    return new Tween(begin: -200.0, end: 25.0).animate(controller);
  }

  Fish fish;

  AnimatedFishWidget( {
    Key key,
    @required this.fish,
    @required this.controller,
  }) : assert(controller != null),
        super(key: key, listenable: _getAnimation(controller));

  Animation<double> get animation => listenable;

  @override
  Widget build(BuildContext context) {

    fish.checkAndPushOffFromBorder();
    fish.nextPosition();


    return new Positioned(
        bottom: fish.position.y, left: fish.position.x,
        child: Container(
          height: fish.getContainerHeight(),
          width: fish.getContainerWidth(),
          color: fish.getColor(),
        )
    );
  }

}
