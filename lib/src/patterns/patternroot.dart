import 'package:flutter/rendering.dart';
import 'pattern.dart';

class PatternRoot extends Pattern {
  final List<Pattern> patterns;

  int _nbTilesCached = 0;
  double _heightCached = 0;
  final Map<int, SliverGridGeometry> _cacheGeo = {};

  @override
  void init(double crossAxisExtentConstraint) {
    for (var p in patterns) {
      p.init(crossAxisExtentConstraint);
    }
    int nb = 0;
    double h = 0;
    for (var element in patterns) {
      nb += element.nbTiles;
      h += element.height;
    }
    _nbTilesCached = nb;
    _heightCached = h;
  }

  PatternRoot({required this.patterns});

  int getMaxChildIndexForScrollOffset(double scrollOffset) {
    if (height == 0) {
      return 1;
    }

    int nbPattern = scrollOffset ~/ height;
    return (nbPattern + 1) * nbTiles;
  }

  @override
  double get height {
    return _heightCached;
  }

  @override
  int get nbTiles {
    return _nbTilesCached;
  }

  @override
  SliverGridGeometry getGeometry(int index) {
    var cached = _cacheGeo[index];
    if (cached != null) {
      return cached;
    }

    if (nbTiles == 0) {
      return const SliverGridGeometry(
          scrollOffset: 0,
          crossAxisOffset: 0,
          crossAxisExtent: 0,
          mainAxisExtent: 0);
    }

    var pIndex = (index ~/ nbTiles);
    var subIndex = index - (pIndex * nbTiles);

    double offset = pIndex * height;
    for (var i = 0; i < patterns.length; i++) {
      if (subIndex < patterns[i].nbTiles) {
        var geo = patterns[i].getGeometry(subIndex);

        var ret = SliverGridGeometry(
            scrollOffset: offset + geo.scrollOffset,
            crossAxisOffset: geo.crossAxisOffset,
            crossAxisExtent: geo.crossAxisExtent,
            mainAxisExtent: geo.mainAxisExtent);
        _cacheGeo[index] = ret;
        return ret;
      }
      subIndex -= patterns[i].nbTiles;
      offset += patterns[i].height;
    }
    assert(false);
    return const SliverGridGeometry(
        scrollOffset: 0,
        crossAxisOffset: 0,
        crossAxisExtent: 0,
        mainAxisExtent: 0);
  }
}
