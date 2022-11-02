import 'package:flutter/rendering.dart';
import 'pattern.dart';

/// Create 2 tiles, width is defined by a ratio between tile 1 and tile 2
class Pattern2Tiles extends Pattern {
  double _tileWidth1 = 0;
  double _tileWidth2 = 0;

  /// Height of a tile
  double tileHeight;

  /// Width ratio between tile 1 and tile 2
  double ratio;

  Pattern2Tiles({
    required this.ratio,
    required this.tileHeight,
  });

  @override
  void init(double crossAxisExtentConstraint) {
    _tileWidth1 = crossAxisExtentConstraint * ratio;
    _tileWidth2 = crossAxisExtentConstraint - _tileWidth1;
  }

  @override
  double get height {
    return tileHeight;
  }

  @override
  int get nbTiles {
    return 2;
  }

  @override
  SliverGridGeometry getGeometry(int index) {
    if (index == 0) {
      return SliverGridGeometry(
          scrollOffset: 0,
          crossAxisOffset: 0,
          crossAxisExtent: _tileWidth1,
          mainAxisExtent: tileHeight);
    }

    return SliverGridGeometry(
        scrollOffset: 0,
        crossAxisOffset: _tileWidth1,
        crossAxisExtent: _tileWidth2,
        mainAxisExtent: tileHeight);
  }
}
