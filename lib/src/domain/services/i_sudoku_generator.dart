import 'package:sudoku/src/domain/entities/board.dart';
import 'package:sudoku/src/domain/value_objects/difficulty.dart';

abstract interface class ISudokuGenerator {
  Board generate({required Difficulty difficulty});
}