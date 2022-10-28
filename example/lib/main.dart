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
      home: const MyHomePage(title: 'Flutter Grid Pattern Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  Color _colorFromIndex(int index) {
    return _colorTable[index % _colorTable.length];
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: CustomScrollView(slivers: [
          SliverGrid(
            gridDelegate: SliverGridPatternDelegate(patterns: [
              PatternNTiles(tileHeight: 100, nb: 4),
              PatternRow(patterns: [
                PatternCol(patterns: [
                  PatternNTiles(tileHeight: 50, nb: 2),
                  PatternNTiles(tileHeight: 100, nb: 3),
                  PatternNTiles(tileHeight: 50, nb: 2),
                ]),
                PatternNTiles(tileHeight: 200, nb: 2),
              ]),
              PatternRow(patterns: [
                PatternNTiles(tileHeight: 200, nb: 2),
                PatternNTiles(tileHeight: 200, nb: 1),
                PatternCol(patterns: [
                  PatternNTiles(tileHeight: 100, nb: 2),
                  PatternNTiles(tileHeight: 100, nb: 3),
                ])
              ]),
            ]),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(5.0),
                color: _colorFromIndex(index),
                child: Text("Tile $index"),
              );
            }),
          )
        ]));
  }
}
