import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weighttracker/model/weight_save.dart';
import 'package:weighttracker/weight_list_item.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Weight Tracker',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomePage(title: 'Weight Tracker'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WeightSave> weightSaves= new List();

  void _addWeightSave() {
    setState(() {
      weightSaves.add(
        new WeightSave(
          new DateTime.now(),
          new Random().nextInt(100).toDouble()
        )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView(
        children: weightSaves.map((WeightSave weightSave) {
          double difference = weightSaves.first == weightSave
              ? 0.0
              : weightSave.weight - weightSaves[weightSaves.indexOf(weightSave) - 1].weight;
          return new WeightListItem(weightSave, difference);
        }).toList(),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addWeightSave,
        tooltip: 'Add new weight entry',
        child: new Icon(Icons.add),
      ),
    );
  }
}