import 'package:sudoku/src/domain/entities/board.dart';
import 'package:sudoku/src/domain/services/i_sudoku_generator.dart';
import 'package:sudoku/src/domain/value_objects/difficulty.dart';

class GenerateSudokuUsecase {
  final ISudokuGenerator generator;
  GenerateSudokuUsecase({required this.generator});

  Board call({required Difficulty difficulty}) {
    return generator.generate(difficulty: difficulty);
  }
}