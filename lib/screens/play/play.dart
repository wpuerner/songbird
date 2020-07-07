import 'dart:async';

import 'package:flutter/material.dart';
import 'package:songassociation/controller/word_controller.dart';
import 'package:songassociation/screens/end/end.dart';

class PlayScreen extends StatefulWidget {

  PlayScreen({Key key}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {

  String _word;

  int _secondsPerWord;

  int _currentSeconds;

  Timer _playTimer;

  _PlayScreenState() {
    this._word = WordController().getNextWord();
    this._secondsPerWord = WordController().wordDurationInSeconds;
    this._currentSeconds = this._secondsPerWord;
  }

  void _advancePlayScreenWithResult(bool gotIt) {
    WordController().submitWordResult(gotIt);
    if (WordController().isNextWordAvailable()) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PlayScreen())
      );
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => EndScreen())
      );
    }
  }

  @override
  void initState() {
    _playTimer = new Timer.periodic(Duration(seconds: 1), (timer) {
      if(_currentSeconds > 0) {
        setState(() {
          _currentSeconds--;
        });
      } else {
        _advancePlayScreenWithResult(false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _playTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Material(
            child: Directionality(
                textDirection: TextDirection.ltr,
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("$_currentSeconds"),
                          Text(_word),
                          RaisedButton(
                              key: Key("gotItButton"),
                              onPressed: () {
                                _advancePlayScreenWithResult(true);
                              },
                              child: Text("I got it!")
                          )
                        ]))
            )
        )
    );
  }
}
