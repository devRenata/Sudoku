import 'package:flutter_test/flutter_test.dart';
import 'package:sudoku/src/domain/entities/board.dart';
import 'package:sudoku/src/domain/entities/cell.dart';
import 'package:sudoku/src/domain/exceptions/invalid_coordinate_exception.dart';
import 'package:sudoku/src/domain/exceptions/invalid_edit_exception.dart';
import 'package:sudoku/src/domain/exceptions/invalid_value_exception.dart';
import 'package:sudoku/src/domain/value_objects/coordinate.dart';
import 'package:sudoku/src/domain/value_objects/difficulty.dart';

void main() {
  group('Board Entity |', () {
    List<List<Cell>> createEmptyCells() {
      return List.generate(9, (row) {
        return List.generate(9, (col) {
          return Cell(
            coordinate: Coordinate(row: row, col: col),
            isEditable: true,
            solution: row * 9 + col + 1,
            value: 0,
          );
        });
      });
    }

    test('updateCell should update cell correctly', () {
      final board = Board(difficulty: Difficulty.easy, cells: createEmptyCells());
      final coordinate = Coordinate(row: 0, col: 0);

      final updatedBoard = board.updateCell(coordinate: coordinate, value: 1);
      expect(updatedBoard.cellAt(0, 0).value, equals(1));
      expect(updatedBoard.cellAt(0, 1).value, equals(0));
    });

    test('updateCell should throw InvalidEditException if cell is not editable', () {
      final cells = createEmptyCells();
      cells[0][0] = Cell(coordinate: Coordinate(row: 0, col: 0), isEditable: false, solution: 1, value: 1);
      final board = Board(difficulty: Difficulty.easy, cells: cells);

      expect(
        () => board.updateCell(coordinate: Coordinate(row: 0, col: 0), value: 1),
        throwsA(isA<InvalidEditException>()),
      );
    });

    test('validateEdit should throw InvalidCoordinateException for invalid coordinates', () {
      final board = Board(difficulty: Difficulty.easy, cells: createEmptyCells());

      expect(
        () => board.validateEdit(coordinate: Coordinate(row: -1, col: 0), value: 0),
        throwsA(isA<InvalidCoordinateException>()),
      );

      expect(
        () => board.validateEdit(coordinate: Coordinate(row: 0, col: 9), value: 0),
        throwsA(isA<InvalidCoordinateException>()),
      );
    });

    test('validateEdit should throw InvalidValueException for value out of range', () {
      final board = Board(difficulty: Difficulty.easy, cells: createEmptyCells());

      expect(
        () => board.validateEdit(coordinate: Coordinate(row: 0, col: 0), value: -1),
        throwsA(isA<InvalidValueException>()),
      );

      expect(
        () => board.validateEdit(coordinate: Coordinate(row: 0, col: 0), value: 10),
        throwsA(isA<InvalidValueException>()),
      );
    });

    test('isFilled should return false for a partially filled board', () {
      final board = Board(difficulty: Difficulty.easy, cells: createEmptyCells());
      expect(board.isFilled, isFalse);
    });

    test('isFilled should return true for a fully populated board', () {
      final cells = createEmptyCells().map((row) {
        return row.map((cell) => cell.copyWith(value: cell.solution)).toList();
      }).toList();

      final board = Board(difficulty: Difficulty.easy, cells: cells);
      expect(board.isFilled, isTrue);
    });

    test('isSolved should return true only if all cells are correct', () {
      final cells = createEmptyCells().map((row) {
        return row.map((cell) => cell.copyWith(value: cell.solution)).toList();
      }).toList();

      final board = Board(difficulty: Difficulty.hard, cells: cells);
      expect(board.isSolved, isTrue);

      final wrongCells = List<List<Cell>>.from(cells);
      wrongCells[0][0] = wrongCells[0][0].copyWith(value: 999);
      final wrongBoard = Board(difficulty: Difficulty.medium, cells: wrongCells);
      expect(wrongBoard.isSolved, isFalse);
    });
  });
}