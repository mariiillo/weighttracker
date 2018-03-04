import 'package:flutter/material.dart';
import 'package:weighttracker/home_page.dart';

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