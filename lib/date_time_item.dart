import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

class DateTimeItem extends StatelessWidget {
  DateTimeItem({Key key, DateTime dateTime, @required this.onChanged})
    : assert(onChanged != null),
      date = dateTime == null
          ? new DateTime.now()
          : new DateTime(dateTime.year, dateTime.month, dateTime.day),
      time = dateTime == null
          ? new DateTime.now()
          : new TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
      super(key: key);

  final DateTime date;
  final TimeOfDay time;
  final ValueChanged<DateTime> onChanged;

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new InkWell(
            onTap: (() => _showDatePicker(context)),
            child: new Padding(
              padding: new EdgeInsets.symmetric(vertical: 8.0),
              child: new Text(new DateFormat('EEEE, MMMM d').format(date))
            ),
          ),
        ),
        new InkWell(
          onTap: (() => _showTimePicker(context)),
          child: new Padding(
            padding: new EdgeInsets.symmetric(vertical: 8.0),
            child: new Text(time.format(context))
          ),
        ),
      ],
    );
  }

  Future _showDatePicker(BuildContext context) async {
    DateTime dateTimePicked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date.subtract(const Duration(days: 20000)),
      lastDate: new DateTime.now()
    );

    if (dateTimePicked != null) {
      onChanged(
          new DateTime(
              dateTimePicked.year,
              dateTimePicked.month,
              dateTimePicked.day,
              time.hour,
              time.minute
          )
      );
    }
  }

  Future _showTimePicker(BuildContext context) async {
    TimeOfDay timeOfDay = await showTimePicker(context: context, initialTime: time);

    if (timeOfDay != null) {
      onChanged(
        new DateTime(
          date.year,
          date.month,
          date.day,
          timeOfDay.hour,
          timeOfDay.minute
        )
      );
    }
  }

}