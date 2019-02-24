import 'package:aqua_app/views/aquarium/AquariumWidget.dart';
import 'package:aqua_app/models/Population.dart';
import 'package:aqua_app/constants/Settings.dart';
import 'package:aqua_app/views/settings/SettingsPage.dart';
import 'package:flutter/material.dart';

class AquaScreen extends StatefulWidget {



  @override
  _AquaScreenState createState() => _AquaScreenState();
}

class _AquaScreenState extends State<AquaScreen> with TickerProviderStateMixin {

  Population population;
  AnimationController controller;
  bool generateNew = true;

  @override
  void initState() {
    population = new Population();
    controller = AnimationController(
        vsync: this,
        duration: Settings.DEFAULT_DURATION
    );
    controller.forward(from: 0.0);
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    if( generateNew || population == null){
      population.setScreenSize(size);
      population.createRandomPopulation(size);
    }


    return Stack(
      children: <Widget>[

        Container(
            color: Colors.lightBlue.withOpacity(0.8),
            child: AquariumWidget(
              maxSize: size,
              allFish: population.allFish,
              controller: controller,
            )
        ),

        Positioned(
          bottom: 10.0,
          left: 10.0,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              child: Container(
                height: 50.0,
                width: 50.0,
                child: Icon(Icons.settings, color: Colors.yellowAccent, size: 35.0),
              ),
              onTap: (){
                getBuilder();
              },
            ),
          )
        ),

        Positioned(
          bottom: 10.0,
          right: 10.0,
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              child: Container(
                height: 50.0,
                width: 50.0,
                child: Icon(Icons.refresh, color: Colors.yellowAccent, size: 35.0),
              ),
              onTap: (){
                setState(() {
                  generateNew = true;
                  controller.forward(from: 0.0);
                });
              },
            ),
          )
        ),
      ],
    );
  }


  getBuilder(){ //TODO)
    Navigator.of(context).push(new PageRouteBuilder(
        opaque: false,
        transitionDuration: Duration(milliseconds: 200),
        pageBuilder: (BuildContext context, _ , __) {
          return SettingsPage();
        },
        transitionsBuilder: (_, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          return new SlideTransition(
            position: new Tween<Offset>(
              begin: const Offset(0.0, 1.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        }
    )).then((_){
      setState(() {
        generateNew = false;
        controller.forward(from: 0.0);
      });
    });
  }


}
