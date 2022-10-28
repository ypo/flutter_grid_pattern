import 'package:flutter/rendering.dart';
import 'pattern.dart';

class PatternCol extends Pattern {
  final List<Pattern> patterns;
  int _totalNbTiles = 0;
  double _totalHeight = 0.0;
  PatternCol({required this.patterns});

  @override
  init(double crossAxisExtentConstraint) {
    this.crossAxisExtentConstraint = crossAxisExtentConstraint;
    _totalNbTiles = 0;
    _totalHeight = 0.0;
    for (var p in patterns) {
      p.init(crossAxisExtentConstraint);
      _totalNbTiles += p.nbTiles;
      _totalHeight += p.height;
    }
  }

  @override
  double get height {
    return _totalHeight;
  }

  @override
  int get nbTiles {
    return _totalNbTiles;
  }

  @override
  SliverGridGeometry getGeometry(int index) {
    int i = 0;
    double offset = 0;
    for (i = 0; i < patterns.length; i++) {
      if (index < patterns[i].nbTiles) {
        break;
      }
      index -= patterns[i].nbTiles;
      offset += patterns[i].height;
    }
    var geo = patterns[i].getGeometry(index);

    var ret = SliverGridGeometry(
        scrollOffset: offset + geo.scrollOffset,
        crossAxisOffset: geo.crossAxisOffset,
        crossAxisExtent: geo.crossAxisExtent,
        mainAxisExtent: geo.mainAxisExtent);

    return ret;
  }
}
