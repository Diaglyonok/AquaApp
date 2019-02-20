
import 'dart:math';

import 'package:flutter/material.dart';

class Fish {

  Fish.generate(Size maxSize){
    Random random = new Random();

    direction = new Direction(getRandomSign() * (1 + random.nextInt(10)), getRandomSign() * (1 + random.nextInt(10)));
    size = 1 + random.nextInt(5);
    speed = 1 / size;
    aquariumBorders = maxSize;

    while(true){
      position = new Position(random.nextDouble() * maxSize.width, random.nextDouble() * maxSize.height);
      if (!checkCrossHorizontalBorders() && !checkCrossVerticalBorders()){
        break;
      }
    }

  }




  static const double proportions = 1/2;
  static const Map sizeToColor = {
    1 : Colors.green,
    2 : Colors.yellow,
    3 : Colors.orange,
    4 : Colors.red,
    5 : Colors.purpleAccent
  };
  static const double FISH_SIZE_CONST = 20.0;

  Position position;
  int size;
  double speed;
  Direction direction;
  Size aquariumBorders;


  getRandomSign(){
    Random random = new Random();
    int res = random.nextInt(2);
    return res == 0 ? -1 : 1;
  }

  getContainerHeight(){
    return size * Fish.FISH_SIZE_CONST * Fish.proportions;
  }

  getContainerWidth(){
    return size * Fish.FISH_SIZE_CONST;
  }

  getColor() {
    return sizeToColor[size];
  }

  nextPosition(){
    Position cur = position;
    position = new Position(cur.x + direction.horizDirection * speed, cur.y + direction.vertDirection * speed);
  }

  checkCrossHorizontalBorders(){
    return position.x + getContainerWidth() > aquariumBorders.width || position.x < 0;
  }

  checkCrossVerticalBorders(){
    return position.y + getContainerHeight() > aquariumBorders.height || position.y < 0;
  }

  checkAndPushOffFromBorder(){
    if (checkCrossHorizontalBorders()) { //right Border
      direction.horizDirection = - direction.horizDirection;
    }

    if (checkCrossVerticalBorders()) { //top Border
      direction.vertDirection = - direction.vertDirection;
    }

  }

}


class Position {

  double x;
  double y;

  Position(this.x, this.y);
}


class Direction {

  int vertDirection;
  int horizDirection;

  Direction(this.vertDirection, this.horizDirection);

  double getAngle(){
    return atan(vertDirection / horizDirection);
  }
}