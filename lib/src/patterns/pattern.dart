import 'package:flutter/rendering.dart';

/// Generic pattern definition
abstract class Pattern {
  double crossAxisExtentConstraint = 0;

  /// Initialize the pattern with a width of [crossAxisExtentConstraint]
  void init(double crossAxisExtentConstraint);

  /// Number of tiles inside this pattern
  int get nbTiles;

  /// Total height of the pattern
  double get height;

  /// Returns the geometry of tile at [index].
  ///
  /// [index] ranges from 0 - [nbTiles]
  SliverGridGeometry getGeometry(int index);
}
