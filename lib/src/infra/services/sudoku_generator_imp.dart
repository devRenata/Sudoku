import 'dart:math';
import 'package:sudoku/src/domain/entities/board.dart';
import 'package:sudoku/src/domain/entities/cell.dart';
import 'package:sudoku/src/domain/services/i_sudoku_generator.dart';
import 'package:sudoku/src/domain/value_objects/coordinate.dart';
import 'package:sudoku/src/domain/value_objects/difficulty.dart';

class SudokuGeneratorImp implements ISudokuGenerator {
  final Random _random = Random();

  @override
  Board generate({required Difficulty difficulty}) {
    final List<List<Cell>> cells = List.generate(
      9,
      (row) => List.generate(
        9,
        (col) => Cell(
          coordinate: Coordinate(row: row, col: col),
          isEditable: false,
          solution: 0,
          value: 0,
        ),
      ),
    );

    _fillBoard(cells: cells);
    _removeCells(cells: cells, difficulty: difficulty);

    return Board(difficulty: difficulty, cells: cells);
  }

  bool _fillBoard({required List<List<Cell>> cells}) {
    for (int row = 0; row < 9; row++) {
      for (int col = 0; col < 9; col++) {

        // if the cell is empty
        if (cells[row][col].value == 0) {
          final numbers = List.generate(9, (i) => i + 1)..shuffle(_random);
          
          // try to place each number on the board
          for (final n in numbers) {
            if (_isValidMove(cells: cells, row: row, col: col, value: n)) {
              cells[row][col] = Cell(
                coordinate: Coordinate(row: row, col: col),
                isEditable: false,
                solution: n,
                value: n,
              );

              // calls recursively to fill in the rest
              if (_fillBoard(cells: cells)) return true;

              // if failed, go back (backtrack)
              cells[row][col] = Cell(
                coordinate: cells[row][col].coordinate,
                isEditable: false,
                solution: 0,
                value: 0,
              );
            }
          }
          return false;
        }
      }
    }
    return true;
  }

  void _removeCells({
    required List<List<Cell>> cells,
    required Difficulty difficulty,
  }) {
    final totalCells = 81;
    final totalToRemove = totalCells - difficulty.clues;
    int removed = 0;

    final coordinates = <Coordinate>[];
    for (var row = 0; row < 9; row++) {
      for (var col = 0; col < 9; col++) {
        coordinates.add(Coordinate(row: row, col: col));
      }
    }
    coordinates.shuffle(_random);

    for (final c in coordinates) {
      if (removed >= totalToRemove) break;

      final cell = cells[c.row][c.col];
      if (cell.value == 0) continue;

      final backup = cell.value;

      cells[c.row][c.col] = Cell(
        coordinate: c,
        isEditable: true,
        solution: cell.solution,
        value: 0,
      );

      final testBoard = Board(difficulty: difficulty, cells: _cloneCells(cells),);
      final solutions = _countSolutions(board: testBoard);

      if (solutions != 1) {
        cells[c.row][c.col] = Cell(
          coordinate: c,
          isEditable: false,
          solution: backup,
          value: cell.solution,
        );
      } else {
        removed++;
      }
    }
  }

  int _countSolutions({required Board board}) {
    final cells = _cloneCells(board.cells);
    int solutions = 0;
    
    bool solve(int row, int col) {
      if (row == 9) {
        solutions++;
        return solutions > 1;
      }

      if (col == 9) return solve(row + 1, 0);

      if (cells[row][col].value != 0) {
        return solve(row, col + 1);
      }

      for (int num = 1; num <= 9; num++) {
        if (_isValidMove(cells: cells, row: row, col: col, value: num)) {
          cells[row][col] = Cell(
            coordinate: Coordinate(row: row, col: col),
            isEditable: true,
            value: num,
            solution: cells[row][col].solution,
          );

          if (solve(row, col + 1)) return true;
        }
      }

      cells[row][col] = Cell(
        coordinate: Coordinate(row: row, col: col),
        isEditable: true,
        solution: cells[row][col].solution,
        value: 0,
      );

      return false;
    }

    solve(0, 0);
    return solutions;
  }

  bool _isValidMove({
    required List<List<Cell>> cells,
    required int row,
    required int col,
    required int value,
  }) {
    for (var c = 0; c < 9; c++) {
      if (cells[row][c].value == value) return false;
    }

    for (var r = 0; r < 9; r++) {
      if (cells[r][col].value == value) return false;
    }

    final startRow = (row ~/ 3) * 3;
    final startCol = (col ~/ 3) * 3;
    for (var r = startRow; r < startRow + 3; r++) {
      for (var c = startCol; c < startCol + 3; c++) {
        if (cells[r][c].value == value) return false;
      }
    }
    return true;
  }

  List<List<Cell>> _cloneCells(List<List<Cell>> original) {
    return original
      .map((row) => row
          .map((cell) => Cell(
                coordinate: cell.coordinate,
                isEditable: cell.isEditable,
                value: cell.value,
                solution: cell.solution,
              ))
          .toList())
      .toList();
  }
}
