import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:songbird/controller/word_controller.dart';
import 'package:songbird/model/word.dart';
import 'package:songbird/screens/end/word_result_box.dart';

import 'navigation_button_row.dart';

class EndScreen extends StatelessWidget {

  EndScreen({Key key}) : super(key: key);

  _getNumberCorrectText() {
    return WordController().getNumberCorrectForRound().toString() +
        "/" + WordController().wordCountPerRound.toString();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        child: Center(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child:  Column(
                children: <Widget>[
                  Text(
                    "You got",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: "AmaticSC"
                    )
                  ),
                  Text(
                    _getNumberCorrectText(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 72,
                      fontFamily: "AmaticSC",
                      fontWeight: FontWeight.bold
                    )
                  ),
                  Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: _constructWordResultBoxList()
                    )
                  ),
                  Container(height: 20),
                  NavigationButtonRow()
                ]
              )
            )
           
          )
        )
      )
    );
  }

  List<Widget> _constructWordResultBoxList() {
    List<Widget> wordResultBoxList = List();

    Queue<Word> playedWordsQueue = WordController().playedWordsQueue;
    Queue<bool> wordResultsQueue = WordController().wordResultsQueue;

    while(playedWordsQueue.isNotEmpty) {
      wordResultBoxList.add(WordResultBox(word: playedWordsQueue.removeFirst(), isGotIt: wordResultsQueue.removeFirst()));
    }

    return wordResultBoxList;
  }
}