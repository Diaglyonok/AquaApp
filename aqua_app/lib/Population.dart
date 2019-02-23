import 'dart:math';

import 'package:aqua_app/AquaScreen.dart';
import 'package:aqua_app/Settings.dart';
import 'package:aqua_app/Fish.dart';
import 'package:flutter/material.dart';

class Population {
  List<Fish> allFish;
  Size maxSize;

  List<Fish> createRandomPopulation(Size maxSize) {
    List<Fish> result = new List();

    for (int i = 0; i < Settings.NUM_OF_FISH; i++){

      result.add(Fish.generate(maxSize));
    }

    return result;
  }




  void setScreenSize(Size screenSize) {
    maxSize = screenSize;
    allFish = createRandomPopulation(maxSize);
  }
}