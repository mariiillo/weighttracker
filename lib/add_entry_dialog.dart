import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weighttracker/date_time_item.dart';
import 'package:weighttracker/model/weight_save.dart';
import 'package:numberpicker/numberpicker.dart';

class AddEntryDialog extends StatefulWidget {

  @override
  _AddEntryDialogState createState() => new _AddEntryDialogState();
}

class _AddEntryDialogState extends State<AddEntryDialog> {
  DateTime _dateTime = new DateTime.now();
  double _weight;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: const Text("New Entry"),
        actions: [
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop(
                new WeightSave(
                  new DateTime.now(),
                  new Random().nextInt(100).toDouble()
                )
              );
            },
            child: new Text('SAVE',
              style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.white)
            )
          )
        ],
      ),
      body: new Column(
        children: [
          new ListTile(
            leading: new Icon(Icons.today, color: Colors.grey[500]),
            title: new DateTimeItem(
              dateTime: _dateTime,
              onChanged: (dateTime) => setState(() => _dateTime = dateTime),
            ),
          ),
          new ListTile(
            leading: new Image.asset(
              "assets/scale-bathroom.png",
              color: Colors.grey[500],
              height: 24.0,
              width: 24.0
            ),
            title: new Text(
              "$double _weight km",
            ),
            onTap: () => _showWeightPicker(context),
          )
        ],
      )
    );
  }

  _showWeightPicker(BuildContext context) {
    showDialog(
      context: context,
      child: new NumberPickerDialog.decimal(
        minValue: 1,
        maxValue: 150,
        initialDoubleValue: _weight,
        title: new Text("Enter your weight"),
      ),
    ).then((value) {
      if(value != null) {
        setState(() => _weight = value);
      }
    });
  }
}