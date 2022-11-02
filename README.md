

# flutter_grid_patterm

Flutter Sliver Grid delegate that allow to generate box patterns for SliverGrid.

![Demo](https://raw.githubusercontent.com/ypo/flutter_grid_pattern/master/web/demo1.gif)

## Getting started


In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  flutter_grid_patterm: <latest_version>
```

## Example
---

```dart
import 'package:flutter_grid_pattern/flutter_grid_pattern.dart';

class GridPatternDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
          SliverGrid(
            // Attach SliverGridPatternDelegate to SliverGrid
            gridDelegate: SliverGridPatternDelegate(patterns: [
              // Add your list of patterns
              PatternNTiles(tileHeight: 150, nb: 3),
              PatternRow(patterns: [
                PatternNTiles(tileHeight: 150, nb: 1),
                PatternNTiles(tileHeight: 150, nb: 2),
              ]),
            ]),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                child: Text("tile $index")
              );
            }),
          )
        ]));
  }
}
```

## Patterns
---

### [PatternNTiles](https://github.com/ypo/flutter_grid_pattern/blob/master/lib/src/patterns/patternntiles.dart)


Create an horizontal list of tile. All tiles have the same width and a fixed height.

| Parameter |  Description  |
| ------------ |  ------------ |
| tileHeight  | Height of the tiles |
| nb | Number of tiles |

### Example

```dart
// Pattern is a row composed of 4 tiles
SliverGridPatternDelegate(patterns: [
    PatternNTiles(tileHeight: 75, nb: 4),
]),
)
```

### [Pattern2Tiles](https://github.com/ypo/flutter_grid_pattern/blob/master/lib/src/patterns/pattern2tiles.dart)


Create 2 tiles aligned horizontally. Tiles have the same height. Width is defined by a ratio.

| Parameter |  Description  |
| ------------ |  ------------ |
| tileHeight  | Height of the tiles |
| ratio | Width ratio, corresponds to width of tile1 over width of tile2 |

### Example

```dart
// Pattern composed of
// 2 tiles with width of 1/3 and 2/3
// followed by
// 2 tiles with width of 2/3 and 1/3
SliverGridPatternDelegate(patterns: [
    Pattern2Tiles(tileHeight: 150, ratio: 1/3.0),
    Pattern2Tiles(tileHeight: 150, ratio: 2/3.0),
]),
)
```

![result](https://raw.githubusercontent.com/ypo/flutter_grid_pattern/master/web/2tiles.webp)

### [PatternRow](https://github.com/ypo/flutter_grid_pattern/blob/master/lib/src/patterns/patternrow.dart)

Create a row that contains a list of patterns. All pattern of the list have the same width. The height of the row is the height of the highest pattern in the list.

| Parameter |  Description  |
| ------------ |  ------------ |
| patterns  | A list of patterns |

### Example

```dart
// Pattern is composed of a row containing 2 patterns :
// First 50% : 1 tile
// Last 50% : row of 2 tiles
SliverGridPatternDelegate(patterns: [
    PatternRow(patterns: [
        PatternNTiles(tileHeight: 75, nb: 1),
        PatternNTiles(tileHeight: 75, nb: 2),
    ]),
]),
)
```

![result](https://raw.githubusercontent.com/ypo/flutter_grid_pattern/master/web/row1.webp)

### [PatternCol](https://github.com/ypo/flutter_grid_pattern/blob/master/lib/src/patterns/patterncol.dart)

Place a list of patterns in a column.

| Parameter |  Description  |
| ------------ |  ------------ |
| patterns  | A list of patterns |

### Example

```dart
// A column composed of 1 tile followed by a row of 2 tiles
SliverGridPatternDelegate(patterns: [
    PatternCol(patterns: [
        PatternNTiles(tileHeight: 400, nb: 1),
        PatternNTiles(tileHeight: 200, nb: 2),
    ]),
]),
)
```

![result](https://raw.githubusercontent.com/ypo/flutter_grid_pattern/master/web/col1.webp)

### Example 2

```dart
// A row composed of 2 vertical tiles followed horizontally by another tile
SliverGridPatternDelegate(patterns: [
    PatternRow(patterns: [
      PatternCol(patterns: [
        PatternNTiles(tileHeight: 100, nb: 1),
        PatternNTiles(tileHeight: 100, nb: 1),
      ]),
      PatternNTiles(tileHeight: 200, nb: 1),
    ]),
]),
)
```

![result](https://raw.githubusercontent.com/ypo/flutter_grid_pattern/master/web/col2.webp)