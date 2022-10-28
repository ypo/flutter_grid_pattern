import 'package:flutter/rendering.dart';

abstract class Pattern {
  double crossAxisExtentConstraint = 0;

  void init(double crossAxisExtentConstraint);

  int get nbTiles;
  double get height;
  SliverGridGeometry getGeometry(int index);
}
