import 'package:flutter/material.dart';
import 'package:songbird/controller/word_controller.dart';
import 'package:songbird/screens/home/home.dart';
import 'package:songbird/screens/play/play.dart';
import 'package:songbird/shared/nav_button.dart';

class NavigationButtonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        NavButton("Play again", () {
          WordController().initialize();
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => PlayScreen()));
        }),
        NavButton("Return to home", () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage()));
        })
      ]);
  }
}
