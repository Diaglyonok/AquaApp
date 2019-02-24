import 'package:flutter/material.dart';

class CheckBoxItem extends StatelessWidget {

  CheckBoxItem({this.text, this.checkBoxVal = false, @required this.checkboxFunc}) : super();

  String text;
  bool checkBoxVal;
  Function checkboxFunc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[

          Flexible(
            child: Column(
              children: <Widget>[
                Material(
                  type: MaterialType.transparency,
                  child: Text(text ?? ''),
                )
              ],
            ),
          ),

          Material(
            type: MaterialType.transparency,
            child: Checkbox(value: checkBoxVal, onChanged: checkboxFunc),
          ),


        ],
      ),
    );
  }
}


class CounterItem extends StatelessWidget {

  CounterItem({@required this.plus, @required this.minus, this.text, @required this.mainVal}) : super();

  Function plus;
  Function minus;
  String text;
  dynamic mainVal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: <Widget>[

          Flexible(
            child: Column(
              children: <Widget>[
                Material(
                  type: MaterialType.transparency,
                  child: Text(text ?? ''),
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

                new Text('$mainVal',
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

