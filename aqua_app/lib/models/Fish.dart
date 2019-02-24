
import 'dart:math';

import 'package:aqua_app/constants/Settings.dart';
import 'package:flutter/material.dart';

class Fish {

  Fish.generate(Size maxSize){
    Random random = new Random();

    direction = new Direction(getRandomSign() * (1 + random.nextInt(10)), getRandomSign() * (1 + random.nextInt(10)));
    size = 1 + random.nextInt(6) * 0.2;
    speed = 1 / size * Settings.SPEED_OF_FISH;
    aquariumBorders = maxSize;
    isGrassEating = random.nextInt(2) == 0;
    alive = true;

    do{
      position = new Position(random.nextDouble() * maxSize.width, random.nextDouble() * maxSize.height);
    }
    while(checkCrossHorizontalBorders() || checkCrossVerticalBorders());

  }




  Position position;
  double size;
  double speed;
  Direction direction;
  Size aquariumBorders;
  bool isGrassEating;
  bool alive;

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
    return size * Settings.FISH_SIZE_CONST * Settings.PROPORTIONS;
  }

  getContainerWidth(){
    return size * Settings.FISH_SIZE_CONST;
  }

  refreshSpeed(){
    speed = 1 / size * Settings.SPEED_OF_FISH;
  }

  nextPosition(){
    Position cur = position;
    position = new Position(cur.x + direction.horizDirection * speed, cur.y + direction.vertDirection * speed);
  }

  checkCrossHorizontalBorders(){
    return checkCrossLeft() || checkCrossRight();
  }

  checkCrossVerticalBorders(){
    return checkCrossTop() || checkCrossBottom();
  }

  checkAndPushOffFromBorder(){
    if (checkCrossHorizontalBorders()) { //right Border
      direction.horizDirection = - direction.horizDirection;
    }

    if (checkCrossVerticalBorders()) { //top Border
      direction.vertDirection = - direction.vertDirection;
    }

  }


  void addSize() {

    size += 0.2;
    speed = 1 / size * Settings.SPEED_OF_FISH;

    if (checkCrossTop()){
      position.y -= (position.y + getContainerHeight() - aquariumBorders.height + 5.0);
    }
    if (checkCrossBottom()){
      position.y -= (position.y - 5.0);
    }
    if (checkCrossLeft()){
      position.x -= (position.x - 5.0);
    }
    if (checkCrossRight()){
      position.x -= (position.x + getContainerWidth() - aquariumBorders.width + 5.0);
    }
    if (size > 5){
      alive = false;
    }
  }


  checkCrossRight(){
    return position.x + getContainerWidth() > aquariumBorders.width;
  }

  checkCrossLeft(){
    return position.x < 0;
  }

  checkCrossTop(){
    return position.y + getContainerHeight() > aquariumBorders.height;
  }

  checkCrossBottom(){
    return position.y < 0;
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