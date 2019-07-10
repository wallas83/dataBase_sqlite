import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
void main() { runApp(
  new MaterialApp(
    title: 'database',
    home: new Home(),
  )
);
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('DataBase'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
    );
  }
}

