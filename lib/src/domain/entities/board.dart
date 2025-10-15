import 'package:sudoku/src/domain/entities/cell.dart';
import 'package:sudoku/src/domain/exceptions/cell_conflict_exception.dart';
import 'package:sudoku/src/domain/exceptions/invalid_coordinate_exception.dart';
import 'package:sudoku/src/domain/exceptions/invalid_edit_exception.dart';
import 'package:sudoku/src/domain/exceptions/invalid_value_exception.dart';
import 'package:sudoku/src/domain/value_objects/coordinate.dart';
import 'package:sudoku/src/domain/value_objects/difficulty.dart';

class Board {
  final Difficulty difficulty;
  final List<List<Cell>> cells;

  Board({
    required this.difficulty,
    required this.cells,
  });

  Cell cellAt(int row, int col) => cells[row][col];

  bool get isFilled => cells.every((row) => row.every((cell) => !cell.isEmpty));
  bool get isSolved => cells.every((row) => row.every((cell) => cell.isCorrect));

  Board updateCell({required Coordinate coordinate, required int value}) {
    final cell = cells[coordinate.row][coordinate.col];

    if (!cell.isEditable) {
      throw InvalidEditException(message: 'Essa célula não pode ser editada.');
    }
    
    validateEdit(coordinate: coordinate, value: value);

    final updatedCell = cell.copyWith(value: value);
    final updatedCells = List<List<Cell>>.generate(9, (r) {
      if (r == coordinate.row) {
        return List<Cell>.generate(9, (c) {
          return c == coordinate.col ? updatedCell : cells[r][c];
        });
      }
      return List<Cell>.from(cells[r]);
    });

    return Board(difficulty: difficulty, cells: updatedCells);
  }

  void validateEdit({required Coordinate coordinate, required int value}) {
    if (!coordinate.isValid()) {
      throw InvalidCoordinateException(message: 'Coordenada fora do limite do tabuleiro.');
    }

    if (value < 1 || value > 9) {
      throw InvalidValueException(message: 'Valor inválido. Deve ser entre 1 e 9.');
    }

    if (cells[coordinate.row][coordinate.col].value == value) return;

    if (cells[coordinate.row].any((cell) => cell.value == value)) {
      throw CellConflictException(message: 'Valor já existe nesta linha.');
    }

    for (var r = 0; r < 9; r++) {
      if (cells[r][coordinate.col].value == value) {
        throw CellConflictException(message: 'Valor já existe nesta coluna.');
      }
    }

    final startRow = (coordinate.row ~/ 3) * 3;
    final startCol = (coordinate.col ~/ 3) * 3;

    for (var r = startRow; r < startRow + 3; r++) {
      for (var c = startCol; c < startCol + 3; c++) {
        if (cells[r][c].value == value) {
          throw CellConflictException(message: 'Valor já existe neste bloco 3x3.');
        }
      }
    }
  }

  @override
  String toString() {
    final buffer = StringBuffer();
    for (var row in cells) {
      buffer.writeln(row.map((col) => col.value).join(' '));
    }
    return buffer.toString();
  }
}
