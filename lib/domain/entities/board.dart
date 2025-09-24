import 'package:sudoku/domain/entities/cell.dart';

enum Difficulty { easy, medium, hard }

class Board {
  final Difficulty difficulty;
  final List<List<Cell>> solution;
  final List<List<Cell>> cells;

  Board({
    required this.difficulty,
    required this.solution,
    required this.cells,
  });
}
