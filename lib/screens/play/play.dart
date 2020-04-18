import 'package:flutter/material.dart';
import 'package:songassociation/controller/word_controller.dart';

class PlayScreen extends StatefulWidget {

  PlayScreen({Key key, this.initialTime}) : super(key: key);

  int initialTime;

  @override
  _PlayScreenState createState() => _PlayScreenState(initialTime);
}

class _PlayScreenState extends State<PlayScreen> {
  _PlayScreenState(int initialTime) {
    this._time = initialTime;
    this._word = WordController().getNextWord();
  }

  int _time;

  String _word;

  void _advancePlayScreen() {
    setState(() {
      _word = WordController().getNextWord();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Material(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(_word),
                      RaisedButton(
                        onPressed: () {
                          if(WordController().isNextWordAvailable()) {
                            _advancePlayScreen();
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EndScreen()) //TODO implement this first
                            )
                          }
                        },
                        child: Text("I got it!")
                      )
                    ]))
        )
    );
  }
}
