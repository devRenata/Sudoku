import 'package:sudoku/src/domain/entities/board.dart';
import 'package:sudoku/src/domain/entities/cell.dart';
import 'package:sudoku/src/domain/exceptions/invalid_board_exception.dart';

class BoardDto {
  final Difficulty difficulty;
  final String puzzle;
  final String solution;

  BoardDto({
    required this.difficulty,
    required this.puzzle,
    required this.solution,
  });

  factory BoardDto.fromJson(Map<String, dynamic> json) {
    return BoardDto(
      difficulty: Difficulty.values.byName(json['difficulty']),
      puzzle: json['puzzle'],
      solution: json['solution'],
    );
  }

  Board toEntity() {
    if (puzzle.length != 81 || solution.length != 81) {
      throw InvalidBoardException(message: 'O tabuleiro precisa conter 81 caracteres.');
    }

    final beginningOfLines = [0, 9, 18, 27, 36, 45, 54, 63, 72];
    final List<List<Cell>> cells = [];
    final lineSize = 9;

    for (int i = 0; i < lineSize; i++) {
      final linePuzzle = puzzle.substring(beginningOfLines[i], beginningOfLines[i] + lineSize);
      final lineSolution = solution.substring(beginningOfLines[i], beginningOfLines[i] + lineSize);

      final List<Cell> newLine = [];
      for (int j = 0; j < lineSize; j++) {
        final cell = Cell(
          isEditable: int.parse(linePuzzle[j]) == 0 ? true : false,
          solution: int.parse(lineSolution[j]),
          value: int.parse(linePuzzle[j]),
        );

        newLine.add(cell);
      }
      cells.add(newLine);
    }

    return Board(difficulty: difficulty, cells: cells);
  }
}
