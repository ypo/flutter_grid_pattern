import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_grid_pattern/flutter_grid_pattern.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Grid Pattern Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: GridPatternDemo(),
    );
  }
}

class GridPatternDemo extends StatelessWidget {
  final _colorTable = [
    Colors.amber,
    Colors.blue,
    Colors.blueGrey,
    Colors.cyan,
    Colors.red,
    Colors.yellow,
    Colors.blueAccent,
    Colors.deepPurpleAccent,
    Colors.green,
    Colors.indigo,
    Colors.pink,
    Colors.redAccent,
    Colors.teal
  ];

  GridPatternDemo({super.key});

  Color _colorFromIndex(int index) {
    return _colorTable[index % _colorTable.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Grid Pattern Demo"),
        ),
        body: CustomScrollView(slivers: [
          SliverGrid(
            gridDelegate: SliverGridPatternDelegate(patterns: [
              PatternNTiles(tileHeight: 150, nb: 3),
              PatternRow(patterns: [
                PatternNTiles(tileHeight: 150, nb: 1),
                Pattern2Tiles(tileHeight: 150, ratio: 0.3),
              ]),
              PatternRow(patterns: [
                PatternCol(patterns: [
                  PatternNTiles(tileHeight: 200, nb: 1),
                  PatternNTiles(tileHeight: 200, nb: 1),
                ]),
                PatternNTiles(tileHeight: 400, nb: 1),
              ]),
              Pattern2Tiles(tileHeight: 300, ratio: 0.33),
            ]),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              int assetIndex = index % 10;
              return Container(
                margin: const EdgeInsets.all(5.0),
                color: _colorFromIndex(index),
                child: Stack(children: [
                  Center(
                      child: Image(
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          image: AssetImage("assets/$assetIndex.webp"))),
                  Text(
                    "Tile $index",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ]),
              );
            }),
          )
        ]));
  }
}
