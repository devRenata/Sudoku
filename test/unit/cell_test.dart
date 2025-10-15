import 'package:flutter_test/flutter_test.dart';
import 'package:sudoku/src/domain/entities/cell.dart';
import 'package:sudoku/src/domain/value_objects/coordinate.dart';

void main() {
  group('Cell Entity |', () {
    final coordinate = Coordinate(row: 0, col: 0);

    test('Must identify empty cell', () {
      final cell = Cell(coordinate: coordinate, isEditable: true, solution: 5, value: 0);
      expect(cell.isEmpty, isTrue);
    });

    test('Must identify filled cell', () {
      final cell = Cell(coordinate: coordinate, isEditable: true, solution: 5, value: 3);
      expect(cell.isEmpty, isFalse);
    });

    test('Must identify correct cell', () {
      final cell = Cell(coordinate: coordinate, isEditable: true, solution: 5, value: 5);
      expect(cell.isCorrect, isTrue);
    });

    test('Should identify incorrect cell', () {
      final cell = Cell(coordinate: coordinate, isEditable: true, solution: 5, value: 2);
      expect(cell.isCorrect, isFalse);
    });

    test('copyWith should create new cell with updated value', () {
      final cell = Cell(coordinate: coordinate, isEditable: true, solution: 5, value: 2);
      final newCell = cell.copyWith(value: 5);

      expect(newCell.value, 5);
      expect(newCell.coordinate, cell.coordinate);
      expect(newCell.isEditable, cell.isEditable);
      expect(newCell.solution, cell.solution);
      expect(cell.value, 2);
    });
  });
}