import 'dart:math';

import 'package:aqua_app/Fish.dart';
import 'package:aqua_app/FishWidget.dart';
import 'package:aqua_app/Population.dart';
import 'package:flutter/material.dart';

class AquaScreen extends StatefulWidget {

  static const int NUM_OF_FISH = 10;

  @override
  _AquaScreenState createState() => _AquaScreenState();
}

class _AquaScreenState extends State<AquaScreen> with TickerProviderStateMixin {

  Population population;
  AnimationController controller;

  @override
  void initState() {
    population = new Population();
    controller = AnimationController(
        vsync: this,
        duration: AnimatedFishWidget.DEFAULT_DURATION
    );
    controller.forward(from: 0.0);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    population.setScreenSize(MediaQuery.of(context).size);

    return Container(
      color: Colors.lightBlue.withOpacity(0.8),
      child: Stack(
        children: getFishWidgetList(),
      ),
    );
  }

  List<Widget> getFishWidgetList() {
    List<Widget> res = [];

    population.allFish.forEach((f) {
      res.add(
          AnimatedFishWidget(
            fish: f,
            controller: controller
          )
      );
    });
    return res;
  }




}
