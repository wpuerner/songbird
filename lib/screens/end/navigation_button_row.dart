import 'package:flutter/material.dart';
import 'package:songbird/controller/word_controller.dart';
import 'package:songbird/screens/home/home.dart';
import 'package:songbird/screens/play/play.dart';

class NavigationButtonRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
        Widget>[
      ButtonTheme(
          minWidth: 100,
          height: 60,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          buttonColor: Color(0xff335df3),
          child: RaisedButton(
              onPressed: () {
                WordController().initialize();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PlayScreen()));
              },
              child: Text("Play again",
                  style: TextStyle(
                      fontFamily: "AmaticSC",
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white)))),
      ButtonTheme(
          minWidth: 100,
          height: 60,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          buttonColor: Color(0xff335df3),
          child: RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text("Return to home",
                  style: TextStyle(
                      fontFamily: "AmaticSC",
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white))))
    ]);
  }
}
