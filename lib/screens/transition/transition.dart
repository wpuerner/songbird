import 'dart:async';

import 'package:flutter/material.dart';
import 'package:songbird/controller/sound_controller.dart';
import 'package:songbird/controller/word_controller.dart';
import 'package:songbird/screens/end/end.dart';
import 'package:songbird/screens/play/play.dart';

class TransitionScreen extends StatefulWidget {

  final bool gotIt;

  TransitionScreen({Key key, this.gotIt}) : super(key: key);

  @override
  _TransitionScreenState createState() => _TransitionScreenState(this.gotIt);
}

class _TransitionScreenState extends State<TransitionScreen> {

  bool _gotIt;

  _TransitionScreenState(bool gotIt) {
    this._gotIt = gotIt;
  }

  @override
  void initState() {
    if (_gotIt) {
      SoundController().ding();
    } else {
      SoundController().quack();
    }

    Timer(Duration(seconds: 1), () {
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
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _gotIt ? Color(0xff335df3) : Colors.red,
      child: Center(
        child: Icon(
          _gotIt ? Icons.check : Icons.clear,
          size: 180,
          color: Colors.white
        )
      ),
    );
  }


}