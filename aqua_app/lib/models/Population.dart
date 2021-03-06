import 'package:aqua_app/models/Fish.dart';
import 'package:aqua_app/constants/Settings.dart';
import 'package:flutter/material.dart';

class Population {
  List<Fish> allFish;
  Size maxSize;

  void setScreenSize(Size screenSize) {
    maxSize = screenSize;
  }

  List<Fish> createRandomPopulation(Size maxSize) {
    List<Fish> result = new List();

    for (int i = 0; i < Settings.NUM_OF_FISH; i++){

      result.add(Fish.generate(maxSize));
    }

    allFish = result;
    return result;
  }


}