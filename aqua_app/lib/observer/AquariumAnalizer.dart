import 'dart:math';

import 'package:aqua_app/models/Fish.dart';
import 'package:aqua_app/constants/Settings.dart';
import 'package:flutter/material.dart';

class AquariumAnalyzer {

  List<Fish> fish;
  List<Fish> fishToRemove = List<Fish>();

  AquariumAnalyzer(this.fish);

  List<Fish> checkAll(Size maxSize){
    for (Fish f1 in fish){
      if (!f1.alive){
        fishToRemove.add(f1);
      }

      for (Fish f2 in fish){

        if (f1 == f2){
          continue;
        }

        if (f1.getRadius() + f2.getRadius() > _getDist(f1.getCenterPoint(), f2.getCenterPoint())){
          if (!f1.isGrassEating && f2.isGrassEating && f1.size >= (f2.size - 1) ||
              !f1.isGrassEating && !f2.isGrassEating && f1.size > f2.size) {
            fishToRemove.add(f2);
            if (Settings.ALLOW_GROWING){
              f1.addSize();
            }
          }
        }

      }
    }

    for (Fish removingFish in fishToRemove){
      if (!fish.contains(removingFish)){
        continue;
      }
      _setFuture(maxSize);
      fish.remove(removingFish);
    }
    fishToRemove.clear();

    return fish;
  }


  void killFish(Fish f){
    fishToRemove.add(f);
  }

  double _getDist(Point<double> a, Point<double> b){
    return sqrt((a.x - b.x)*(a.x - b.x) + (a.y - b.y)*(a.y - b.y));
  }

  void _setFuture(Size maxSize) {
    Future.delayed(Duration(seconds: Settings.TIME_TO_REBORN)).then((_){
      if (fish.length == Settings.NUM_OF_FISH){
        return;
      }

      fish.add(Fish.generate(maxSize));
    });
  }
}