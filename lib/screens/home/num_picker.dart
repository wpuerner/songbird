import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NumPicker extends StatefulWidget {
  NumPicker({Key key, this.initialState}) : super(key: key);

  final int initialState;

  @override
  _NumPickerState createState() => _NumPickerState(this.initialState);
}

class _NumPickerState extends State<NumPicker> {
  _NumPickerState(int value) { this._value = value; }
  int _value;

  void _decrementNumValue() {
    setState(() {
      if (_value > 0) { _value--; }
    });
  }

  _incrementNumValue() {
    setState(() {
      _value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          onPressed: _decrementNumValue,
          child: Icon(Icons.arrow_back),
        ),
        Text('$_value'),
        RaisedButton(
            onPressed: _incrementNumValue,
            child: Icon(Icons.arrow_forward),
        ),
      ],
    );
  }

}