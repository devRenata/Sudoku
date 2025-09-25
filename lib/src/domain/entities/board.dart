import 'package:sudoku/src/domain/entities/cell.dart';

enum Difficulty { easy, medium, hard }

class Board {
  final Difficulty difficulty;
  final List<List<Cell>> cells;

  Board({
    required this.difficulty,
    required this.cells,
  });
}
