import 'package:flutter/material.dart';
import 'package:songbird/controller/word_controller.dart';
import 'package:songbird/model/num_picker_value.dart';
import 'package:songbird/shared/nav_button.dart';

import '../play/play.dart';
import 'num_picker.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  NumPickerValue _timePickerValue = new NumPickerValue(value: 10);

  NumPickerValue _wordCountPickerValue = new NumPickerValue(value: 10);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 142, 0, 0),
            child: Text(
              "Songbird",
              style: TextStyle(fontFamily: "AmaticSC", fontSize: 78, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Container()),
          Column(
            children: <Widget> [
              Text(
                "Number of Words",
                style: TextStyle(fontSize: 24),
              ),
              NumPicker(numPickerValue: _wordCountPickerValue),
              Text(
                "Seconds per Word",
                style: TextStyle(fontSize: 24),
              ),
              NumPicker(numPickerValue: _timePickerValue),
            ]

          ),
          Expanded(child: Container()),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 63),
            child: NavButton(
              "Play!",
                () {
                WordController().wordDurationInSeconds = _timePickerValue.value;
                WordController().wordCountPerRound =
                  _wordCountPickerValue.value;
                WordController().initialize();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlayScreen())
                );
              },
              minWidth: 302,
              height: 90,
              fontSize: 48
            )
          )
        ]
      )
    );
  }
}