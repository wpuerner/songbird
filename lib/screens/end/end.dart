import 'package:flutter/material.dart';
import 'package:songassociation/controller/word_controller.dart';
import 'package:songassociation/screens/end/word_result_box.dart';
import 'package:songassociation/screens/home/home.dart';
import 'package:songassociation/screens/play/play.dart';
import 'package:songassociation/model/word.dart';
import 'dart:collection';

class EndScreen extends StatelessWidget {

  EndScreen({Key key}) : super(key: key);

  _getTitleText() {
    return "You got " +
        WordController().getNumberCorrectForRound().toString() +
        "/" + WordController().wordCountPerRound.toString() +
        " correct!";
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Material(
            child: Center(
                child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: ListView(
                        children: _buildChildWidgets(context),
                        scrollDirection: Axis.vertical
                    )
                )
            ))
    );
  }

  List<Widget> _buildChildWidgets(BuildContext context) {
    List<Widget> widgets = List();
    widgets.add(
        Text(
            _getTitleText(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30
            )
        )
    );

    widgets.addAll(_constructWordResultBoxList());

    widgets.add(
        RaisedButton(
            key: Key("restartButton"),
            child: Text("Play again"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlayScreen())
              );
            }
        )
    );

    widgets.add(
        RaisedButton(
            key: Key("homeButton"),
            child: Text("Return to home"),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SongAssociationHomePage())
              );
            }
        )
    );

    return widgets;
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