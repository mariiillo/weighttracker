import 'package:flutter/material.dart';

class AddEntryDialog extends StatefulWidget {

  @override
  _AddEntryDialogState createState() => new _AddEntryDialogState();
}

class _AddEntryDialogState extends State<AddEntryDialog> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("New Entry"),
        actions: [
          new FlatButton(
            onPressed: () {

            },
            child: new Text('SAVE',
              style: Theme.of(context).textTheme.subhead.copyWith(color: Colors.white)
            )
          )
        ],
      ),
      body: new Text('Foo'),
    );
  }
}