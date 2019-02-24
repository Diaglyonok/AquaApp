import 'package:aqua_app/views/settings/SettingsItem.dart';
import 'package:aqua_app/constants/Settings.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {


  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25.0),
      child: Stack(
        children: <Widget>[
          Container(
              height: double.infinity,
              padding: EdgeInsets.only(top: 70, bottom: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
                color: Colors.white.withOpacity(0.8),
                boxShadow: [
                  BoxShadow( color: Colors.black.withOpacity(0.6), blurRadius: 20.0, offset: Offset(0.0, 1.0))
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[

                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text("Изменяются моментально, без обновления:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ),

                    CounterItem(
                      mainVal: Settings.SPEED_OF_FISH,
                      plus: (){
                        setState(() => Settings.SPEED_OF_FISH += 0.5);
                      },
                      minus: (){
                        setState(() {
                          if (Settings.SPEED_OF_FISH <= 0){
                            return;
                          }

                          Settings.SPEED_OF_FISH -= 0.5;
                        });
                      },
                      text: "Скорость рыб: ",
                    ),

                    CounterItem(
                      mainVal: Settings.FISH_SIZE_CONST,
                      plus: (){
                        if (Settings.FISH_SIZE_CONST >= 70){
                          return;
                        }

                        setState(() => Settings.FISH_SIZE_CONST += 1);
                      },
                      minus: (){
                        setState(() {
                          if (Settings.FISH_SIZE_CONST <= 1){
                            return;
                          }

                          Settings.FISH_SIZE_CONST -= 1;
                        });
                      },
                      text: "Размер рыб: ",
                    ),

                    CheckBoxItem(
                        text: 'При нажатии на рыбку, убивать ее: ',
                        checkboxFunc: (val){
                          setState(() => Settings.KILL_FISH_ON_TAP = val);
                        },
                        checkBoxVal: Settings.KILL_FISH_ON_TAP
                    ),

                    CheckBoxItem(
                        text: 'Разрешить рост при поедании: ',
                        checkboxFunc: (val){
                          setState(() => Settings.ALLOW_GROWING = val);
                        },
                        checkBoxVal: Settings.ALLOW_GROWING
                    ),

                    Settings.ALLOW_GROWING ? CounterItem(
                      mainVal: Settings.MAX_GROW_SIZE,
                      minus: (){
                        if (Settings.MAX_GROW_SIZE <= 2){
                          return;
                        }

                        setState(() => Settings.MAX_GROW_SIZE -= 1);
                      },
                      plus: (){
                        if (Settings.MAX_GROW_SIZE >= 10){
                          return;
                        }

                        setState(() => Settings.MAX_GROW_SIZE += 1);
                      },
                      text: "Рыба умрет при коэфициенте роста выше, чем: ",
                    ) : Container(),


                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text("Изменяются после обновления экрана:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ),

                    CounterItem(
                      mainVal: Settings.NUM_OF_FISH,
                      plus: (){
                        setState(() => Settings.NUM_OF_FISH += 1);
                      },
                      minus: (){
                        setState(() {
                          if (Settings.NUM_OF_FISH <= 0){
                            return;
                          }

                          Settings.NUM_OF_FISH -= 1;
                        });
                      },
                      text: "Количество рыб: ",
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Material(
                        type: MaterialType.transparency,
                        child: Text("Применяется для всех заново созданных рыб:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    ),

                    CounterItem(
                      mainVal: Settings.TIME_TO_REBORN,
                      plus: (){
                        setState(() => Settings.TIME_TO_REBORN += 1);
                      },
                      minus: (){
                        setState(() {
                          if (Settings.TIME_TO_REBORN <= 1){
                            return;
                          }

                          Settings.TIME_TO_REBORN -= 1;
                        });
                      },
                      text: "Время перерождения (сек): ",
                    ),


                  ],
                ),
              )
          ),

          Container(
            height: 50.0,
            child: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              title: new Text('Настройки'),
            ),
          )
        ],
      ),
    );
  }



}
