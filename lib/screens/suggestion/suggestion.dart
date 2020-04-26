import 'package:flutter/material.dart';
import 'package:songassociation/model/word.dart';

class SuggestionScreen extends StatelessWidget {

  final Word word;

  SuggestionScreen({Key key, this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: _constructContentWidgetList()
      )
    );

  }

  List<Widget> _constructContentWidgetList() {
    List<Widget> contentWidgetList = List();

    contentWidgetList.add(Text(word.word));
    contentWidgetList.addAll(_constructExampleWidgetList());

    return contentWidgetList;
  }

  List<Widget> _constructExampleWidgetList() {
    List<Widget> exampleWidgetList = List();

    for(Example example in word.examples) {
      exampleWidgetList.add(
        Text(example.songName + " by " + example.artistName)
      );
    }

    return exampleWidgetList;
  }

}