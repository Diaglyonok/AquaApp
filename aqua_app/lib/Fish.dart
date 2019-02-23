
import 'dart:math';

import 'package:aqua_app/Settings.dart';
import 'package:flutter/material.dart';

class Fish {

  Fish.generate(Size maxSize){
    Random random = new Random();

    direction = new Direction(getRandomSign() * (1 + random.nextInt(10)), getRandomSign() * (1 + random.nextInt(10)));
    size = 1 + random.nextInt(5);
    speed = 1 / size;
    aquariumBorders = maxSize;
    isGrassEating = random.nextInt(2) == 0;

    do{
      position = new Position(random.nextDouble() * maxSize.width, random.nextDouble() * maxSize.height);
    }
    while(checkCrossHorizontalBorders() || checkCrossVerticalBorders());

  }




  Position position;
  int size;
  double speed;
  Direction direction;
  Size aquariumBorders;
  bool isGrassEating;

  getCenterPoint(){
    return Point<double>(position.x + getContainerWidth() / 2, position.y + getContainerHeight() / 2);
  }


  getRadius(){
    return sqrt(getContainerHeight() * getContainerHeight() + getContainerWidth() * getContainerWidth()) / 3;
  }

  getRandomSign(){
    Random random = new Random();
    int res = random.nextInt(2);
    return res == 0 ? -1 : 1;
  }

  getContainerHeight(){
    return size * Settings.FISH_SIZE_CONST * Settings.proportions;
  }

  getContainerWidth(){
    return size * Settings.FISH_SIZE_CONST;
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


  void setSize() {
    size +=1;
    speed = 1 / size;
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