import 'package:flutter/material.dart';
import 'package:songassociation/controller/word_controller.dart';
import 'package:songassociation/screens/end/end.dart';

class PlayScreen extends StatefulWidget {

  PlayScreen({Key key}) : super(key: key);

  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  _PlayScreenState() {
    WordController().initialize();
    this._word = WordController().getNextWord();
  }

  String _word;

  void _advancePlayScreenWithResult(bool gotIt) {
    if(WordController().isNextWordAvailable()) {
      setState(() {
        WordController().submitWordResult(gotIt);
        _word = WordController().getNextWord();
      });
    } else {
      WordController().submitWordResult(gotIt);
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EndScreen())
      );
    }
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
                          _advancePlayScreenWithResult(true);
                        },
                        child: Text("I got it!")
                      )
                    ]))
        )
    );
  }
}
