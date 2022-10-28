import 'package:flutter/rendering.dart';
import 'pattern.dart';

class PatternNTiles extends Pattern {
  final double tileHeight;
  double _tileWidth = 0;
  final int nb;

  PatternNTiles({required this.tileHeight, required this.nb});

  @override
  init(double crossAxisExtentConstraint) {
    _tileWidth = crossAxisExtentConstraint / nb;
  }

  @override
  double get height {
    return tileHeight;
  }

  @override
  int get nbTiles {
    return nb;
  }

  @override
  SliverGridGeometry getGeometry(int index) {
    return SliverGridGeometry(
        scrollOffset: 0,
        crossAxisOffset: _tileWidth * index,
        crossAxisExtent: _tileWidth,
        mainAxisExtent: tileHeight);
  }
}
