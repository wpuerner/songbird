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
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Text(
                      word.word,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20
                      )
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child:  IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>
                                    SuggestionScreen(word: this.word))
                            );
                          },
                          icon: Icon(Icons.add_box)
                      )
                    )
                  )
                ]
            )
        )
    );
  }

}