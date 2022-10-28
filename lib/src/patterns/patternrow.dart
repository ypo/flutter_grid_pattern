import 'package:flutter/rendering.dart';
import 'pattern.dart';

class PatternRow extends Pattern {
  final List<Pattern> patterns;
  double _height = 0.0;
  int _nbTiles = 0;
  double _crossAxisExtentConstraintChild = 0.0;
  PatternRow({required this.patterns});

  @override
  init(double crossAxisExtentConstraint) {
    this.crossAxisExtentConstraint = crossAxisExtentConstraint;
    _crossAxisExtentConstraintChild =
        crossAxisExtentConstraint / patterns.length;

    _height = 0;
    _nbTiles = 0;

    for (var p in patterns) {
      p.init(_crossAxisExtentConstraintChild);
      if (p.height > _height) {
        _height = p.height;
      }
      _nbTiles += p.nbTiles;
    }
  }

  @override
  double get height {
    return _height;
  }

  @override
  int get nbTiles {
    return _nbTiles;
  }

  @override
  SliverGridGeometry getGeometry(int index) {
    int i = 0;
    for (i = 0; i < patterns.length; i++) {
      if (index < patterns[i].nbTiles) {
        break;
      }
      index -= patterns[i].nbTiles;
    }
    var geo = patterns[i].getGeometry(index);

    var ret = SliverGridGeometry(
        scrollOffset: geo.scrollOffset,
        crossAxisOffset:
            geo.crossAxisOffset + (_crossAxisExtentConstraintChild * i),
        crossAxisExtent: geo.crossAxisExtent,
        mainAxisExtent: geo.mainAxisExtent);

    return ret;
  }
}
