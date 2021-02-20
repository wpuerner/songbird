import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:songbird/model/num_picker_value.dart';

class NumPicker extends StatefulWidget {
  NumPicker({Key key, this.numPickerValue}) : super(key: key);

  final NumPickerValue numPickerValue;

  @override
  _NumPickerState createState() => _NumPickerState(this.numPickerValue);
}

class _NumPickerState extends State<NumPicker> {
  _NumPickerState(NumPickerValue numPickerValue) { this.numPickerValue = numPickerValue; }

  NumPickerValue numPickerValue;

  void _decrementNumValue() {
    setState(() {
      if (numPickerValue.value > 1) { numPickerValue.value--; }
    });
  }

  _incrementNumValue() {
    setState(() {
      numPickerValue.value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          onPressed: _decrementNumValue,
          child: Text("-", style: TextStyle(fontSize: 64)),
        ),
        Text(
          numPickerValue.value.toString(),
          style: TextStyle(fontSize: 20)
        ),
        FlatButton(
            onPressed: _incrementNumValue,
            child: Text("+", style: TextStyle(fontSize: 64)),
        ),
      ],
    );
  }

}