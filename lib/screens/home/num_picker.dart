import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:songassociation/model/num_picker_value.dart';

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
      if (numPickerValue.value > 0) { numPickerValue.value--; }
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
        RaisedButton(
          onPressed: _decrementNumValue,
          child: Icon(Icons.arrow_back),
        ),
        Text(numPickerValue.value.toString()),
        RaisedButton(
            onPressed: _incrementNumValue,
            child: Icon(Icons.arrow_forward),
        ),
      ],
    );
  }

}