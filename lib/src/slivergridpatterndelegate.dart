import 'package:flutter/rendering.dart';
import 'patterns/patternroot.dart';
import 'patterns/pattern.dart';

class SliverGridPatternDelegate extends SliverGridDelegate {
  final List<Pattern> patterns;

  SliverGridPatternDelegate({required this.patterns});

  final Map<double, _SliverGridPatternLayout> _layouts = {};

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {
    var cached = _layouts[constraints.crossAxisExtent];
    if (cached != null) {
      return cached;
    }

    var layout =
        _SliverGridPatternLayout(constraints: constraints, patterns: patterns);
    _layouts[constraints.crossAxisExtent] = layout;
    return layout;
  }

  @override
  bool shouldRelayout(covariant SliverGridDelegate oldDelegate) {
    return false;
  }
}

class _SliverGridPatternLayout extends SliverGridLayout {
  _SliverGridPatternLayout(
      {required this.constraints, required List<Pattern> patterns}) {
    root = PatternRoot(patterns: patterns);
    root.init(constraints.crossAxisExtent);
  }

  final SliverConstraints constraints;
  late final PatternRoot root;

  @override
  double computeMaxScrollOffset(int childCount) {
    int start = childCount < root.nbTiles ? 0 : childCount - root.nbTiles;
    double ret = 0.0;
    for (int i = start; i < childCount; i++) {
      var geo = root.getGeometry(i);
      var offset = geo.scrollOffset + geo.mainAxisExtent;
      if (offset > ret) {
        ret = offset;
      }
    }
    return ret;
  }

  @override
  SliverGridGeometry getGeometryForChildIndex(int index) {
    return root.getGeometry(index);
  }

  @override
  int getMaxChildIndexForScrollOffset(double scrollOffset) {
    return root.getMaxChildIndexForScrollOffset(scrollOffset);
  }

  @override
  int getMinChildIndexForScrollOffset(double scrollOffset) {
    return 0;
  }
}
