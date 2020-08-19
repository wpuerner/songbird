import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {

  String _text;

  Function _onPressed;

  NavButton(String text, Function onPressed) {
    this._text = text;
    this._onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 100,
      height: 60,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      buttonColor: Color(0xff335df3),
      child: RaisedButton(
        onPressed: this._onPressed,
        child: Text(
          this._text,
          style: TextStyle(
            fontFamily: "AmaticSC",
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.white)
          )
        )
      );
  }






}