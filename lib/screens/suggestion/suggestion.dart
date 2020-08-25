import 'package:flutter/material.dart';
import 'package:songbird/model/word.dart';

class SuggestionScreen extends StatelessWidget {

  final Word word;

  SuggestionScreen({Key key, this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _constructContentWidgetList()
        )
    );

  }

  List<Widget> _constructContentWidgetList() {
    List<Widget> contentWidgetList = List();

    contentWidgetList.add(
      Text(
        word.word,
        style: TextStyle(fontSize: 72)
      )
    );
    contentWidgetList.add(Container(height: 20));
    contentWidgetList.addAll(_constructExampleWidgetList());

    return contentWidgetList;
  }

  List<Widget> _constructExampleWidgetList() {
    List<Widget> exampleWidgetList = List();

    for(Example example in word.examples) {
      exampleWidgetList.add(
        ExampleSongAndArtist(example)
      );
    }

    return exampleWidgetList;
  }

}

class ExampleSongAndArtist extends StatelessWidget {

  ExampleSongAndArtist(this._example);

  final Example _example;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text(
            _example.songName,
            key: Key("songNameText"),
            style: TextStyle(fontSize: 20.0)
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Text(
              "by",
              style: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic)
            )
          ),
          Text(
            _example.artistName,
            key: Key("artistNameText"),
            style: TextStyle(fontSize: 20.0)
          )
        ]
      )
    );
  }


}