import 'package:flutter/material.dart';

import 'home.dart';
import 'model.dart';
import 'second.dart';
import 'third.dart';

List<Model> l1=[];
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Home(),
        '2': (context) => Second(),
        '3': (context) => Third(),
      },
    ),
  );
}
