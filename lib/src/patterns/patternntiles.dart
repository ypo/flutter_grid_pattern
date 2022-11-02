import 'package:flutter/rendering.dart';
import 'pattern.dart';

/// Create a patterns of [nb] tiles, horizontally aligned
class PatternNTiles extends Pattern {
  /// Height of a tile
  final double tileHeight;

  /// Number of tiles in this pattern
  final int nb;

  double _tileWidth = 0;

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
