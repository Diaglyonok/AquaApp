import 'dart:math';

import 'package:aqua_app/models/Fish.dart';
import 'package:aqua_app/views/custom/NoSplashFactory.dart';
import 'package:flutter/material.dart';


class FishWidget extends StatelessWidget{

  Fish curFish;
  Function onTap;

  FishWidget( {
    Key key,
    this.onTap,
    @required this.curFish,
  });

  @override
  Widget build(BuildContext context) {

    curFish.checkAndPushOffFromBorder();
    curFish.nextPosition();
    curFish.refreshSpeed();

    var dx = pi;
    if (curFish.direction.horizDirection <= 0){
      dx = 0;
    }
    return new Positioned(
        bottom: curFish.position.y, left: curFish.position.x,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: onTap,
            onLongPress: onTap,
            splashFactory: const NoSplashFactory(),
            splashColor: Colors.transparent,
            child: Container(
                height: curFish.getContainerHeight(),
                width: curFish.getContainerWidth(),
                child: Transform(
                  transform: Matrix4.identity()
                    ..rotateX(0)
                    ..rotateY(dx),
                  alignment: FractionalOffset.center,
                  child: Image.asset(curFish.isGrassEating ? "img/grass_fish.png" : "img/fish_eating.png"),
                )
            ),
          ),
        )
    );
  }

}
