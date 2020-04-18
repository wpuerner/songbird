import 'package:flutter/material.dart';
import 'package:songassociation/controller/word_controller.dart';
import 'package:songassociation/screens/home/home.dart';
import 'package:songassociation/screens/play/play.dart';

class EndScreen extends StatelessWidget {

  EndScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("You got " + WordController().numberCorrect.toString() + " correct!"),
              RaisedButton(
                child: Text("Play again"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlayScreen())
                  );
                }
              ),
              RaisedButton(
                child: Text("Return to home"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SongAssociationHomePage())
                  );
                }
              )
            ],
          )
        )
      )
    );


  }
}