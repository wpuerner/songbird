import 'package:flutter/material.dart';
import 'package:songbird/controller/word_controller.dart';
import 'package:songbird/screens/home/home.dart';
import 'package:songbird/screens/play/play.dart';

class NavigationButtonRow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          key: Key("restartButton"),
          child: Text("Play again"),
          onPressed: () {
            WordController().initialize();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PlayScreen())
            );
          }
        ),
        RaisedButton(
          key: Key("homeButton"),
          child: Text("Return to home"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                  HomePage())
            );
          }
        )
      ]
    );
  }

}