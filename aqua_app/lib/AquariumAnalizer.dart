import 'dart:math';

import 'package:aqua_app/AquaScreen.dart';
import 'package:aqua_app/Settings.dart';
import 'package:aqua_app/Fish.dart';
import 'package:flutter/material.dart';

class AquariumAnalyzer {

  List<Fish> fish;
  List<Fish> fishToRemove = List<Fish>();

  AquariumAnalyzer(this.fish);

  List<Fish> checkAll(Size maxSize){
    for (Fish f1 in fish){
      for (Fish f2 in fish){

        if (f1 == f2){
          continue;
        }

        if (f1.getRadius() + f2.getRadius() > getDist(f1.getCenterPoint(), f2.getCenterPoint())){
          if (!f1.isGrassEating && f2.isGrassEating && f1.size >= (f2.size - 1) ||
              !f1.isGrassEating && !f2.isGrassEating && f1.size > f2.size) {
            setFuture(maxSize);
            fishToRemove.add(f2);
            //f1.setSize();
          }
        }

      }
    }

    for (Fish removingFish in fishToRemove){
      fish.remove(removingFish);
    }
    return fish;
  }


  getDist(Point<double> a, Point<double> b){
    return sqrt((a.x - b.x)*(a.x - b.x) + (a.y - b.y)*(a.y - b.y));
  }

  void setFuture(Size maxSize) {
    print('Future setted');
    Future.delayed(Duration(seconds: 1)).then((_){
      if (fish.length == Settings.NUM_OF_FISH){
        return;
      }

      fish.add(Fish.generate(maxSize));
      print('Fish added');
    });
  }
}