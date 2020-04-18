import 'package:flutter/material.dart';
import 'num_picker.dart';
import '../play/play.dart';

import 'package:songassociation/controller/word_controller.dart';

class SongAssociationHomePage extends StatefulWidget {
  SongAssociationHomePage({Key key}) : super(key: key);

  @override
  _SongAssociationHomePageState createState() => _SongAssociationHomePageState();
}

class _SongAssociationHomePageState extends State<SongAssociationHomePage> {

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
                    "Time Limit",
                  style: TextStyle(fontSize: 24),
                ),
                NumPicker(initialState: 10),
                Text(
                    "Rounds",
                  style: TextStyle(fontSize: 24),
                ),
                NumPicker(initialState: 10),
                RaisedButton(
                  onPressed: () {
                    WordController().initialize(5); //TODO get this value from the numpicker
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PlayScreen(initialTime: 5)) //TODO get these values from the numpickers
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