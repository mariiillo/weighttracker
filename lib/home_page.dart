import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weighttracker/add_entry_dialog.dart';
import 'package:weighttracker/model/weight_save.dart';
import 'package:weighttracker/weight_list_item.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeightSave> weightSaves= new List();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView.builder(
          itemCount: weightSaves.length,
          itemBuilder: (BuildContext context, int index) {
            WeightSave weightSave = weightSaves[index];
            double difference = weightSaves.first == weightSave
                ? 0.0
                : weightSave.weight - weightSaves[weightSaves.indexOf(weightSave) - 1].weight;
            return new WeightListItem(weightSave, difference);
          }
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _openAddEntryDialog,
        tooltip: 'Add new weight entry',
        child: new Icon(Icons.add),
      ),
    );
  }

  Future _openAddEntryDialog() async {
    WeightSave save = await Navigator.of(context).push(new MaterialPageRoute<WeightSave>(
      builder: (BuildContext context) {
        return new AddEntryDialog();
      },
      fullscreenDialog: true
    ));
    if (save != null) {
      _addWeightSave(save);
    }
  }

  _addWeightSave(save) {
    setState(() {
      weightSaves.add(save);
    });
  }
}