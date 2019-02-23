import 'package:aqua_app/Settings.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {


  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              getItem(
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
                text: "Количество рыб: "
              )
            ],
          )
        ),

        Container(
          height: 80.0,
          child: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            title: new Text(''),
          ),
        )
      ],
    );
  }

  getItem({@required Function plus, @required Function minus, String text}) {
    return Padding(
      padding: EdgeInsets.only(top: 80.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Column(
              children: <Widget>[
                Material(
                  type: MaterialType.transparency,
                  child: Text(text),
                )
              ],
            ),
          ),

          Material(
            type: MaterialType.transparency,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new FlatButton(
                  onPressed: plus,
                  child: new Icon(Icons.add, color: Colors.black),
                ),

                new Text('${Settings.NUM_OF_FISH}',
                    style: new TextStyle(fontSize: 16.0)),

                new FlatButton(
                  onPressed: minus,
                  child: new Icon(
                      const IconData(0xe15b, fontFamily: 'MaterialIcons'),
                      color: Colors.black),
                ),
              ],
            ),
          )


        ],
      ),
    );
  }

}
