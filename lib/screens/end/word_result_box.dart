import 'package:flutter/cupertino.dart';
import 'package:songassociation/model/word.dart';
import 'package:flutter/material.dart';

import 'package:songassociation/screens/suggestion/suggestion.dart';


class WordResultBox extends StatelessWidget {

  final Word word;

  final bool isGotIt;

  WordResultBox({Key key, this.word, this.isGotIt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(
        children: <Widget>[
          Text(word.word),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SuggestionScreen(word: this.word))
              );
            },
            child: Icon(Icons.arrow_forward)
          )
        ]
      )
    );
  }

}