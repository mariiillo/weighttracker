import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weighttracker/date_time_item.dart';
import 'package:weighttracker/model/weight_save.dart';

class AddEntryDialog extends StatefulWidget {

  @override
  _AddEntryDialogState createState() => new _AddEntryDialogState();
}

class _AddEntryDialogState extends State<AddEntryDialog> {
  DateTime _dateTime = new DateTime.now();

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
      body: new ListTile(
        leading: new Icon(Icons.today, color: Colors.grey[500]),
        title: new DateTimeItem(
          dateTime: _dateTime,
          onChanged: (dateTime) => setState(() => _dateTime = dateTime),
        ),
      )
    );
  }
}