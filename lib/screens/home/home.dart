import 'package:flutter/material.dart';
import 'package:songassociation/controller/word_controller.dart';
import 'package:songassociation/model/num_picker_value.dart';

import '../play/play.dart';
import 'num_picker.dart';

class SongAssociationHomePage extends StatefulWidget {
  SongAssociationHomePage({Key key}) : super(key: key);

  @override
  _SongAssociationHomePageState createState() => _SongAssociationHomePageState();
}

class _SongAssociationHomePageState extends State<SongAssociationHomePage> {

  NumPickerValue _timePickerValue = new NumPickerValue(value: 10);

  NumPickerValue _wordCountPickerValue = new NumPickerValue(value: 10);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                    "Song Bird",
                  style: TextStyle(fontSize: 24),
                ),
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
                RaisedButton(
                  onPressed: () {
                    WordController().wordDurationInSeconds = _timePickerValue.value;
                    WordController().wordCountPerRound = _wordCountPickerValue.value;
                    WordController().initialize();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlayScreen())
                    );
                  },
                  child: Text("Start Game!"),
                )
              ]
          )
      )
    );
  }
}