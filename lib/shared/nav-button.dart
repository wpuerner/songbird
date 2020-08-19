import 'dart:core';

import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {

  String _text;

  double minWidth;

  double height;

  double fontSize;

  Function _onPressed;

  NavButton(String text, Function onPressed, {this.minWidth : 200, this.height : 60, this.fontSize : 30}) {
    this._text = text;
    this._onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: this.minWidth,
      height: this.height,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      buttonColor: Color(0xff335df3),
      child: RaisedButton(
        onPressed: this._onPressed,
        child: Text(
          this._text,
          style: TextStyle(
            fontFamily: "AmaticSC",
            fontSize: this.fontSize,
            fontWeight: FontWeight.w700,
            color: Colors.white)
          )
        )
      );
  }
}