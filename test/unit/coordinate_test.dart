import 'package:flutter_test/flutter_test.dart';
import 'package:sudoku/src/domain/value_objects/coordinate.dart';

void main() {
  group('Coordinate Value Object |', () {
    test('Should return True for valid coordinates', () {
      final coordinate = Coordinate(row: 0, col: 0);
      expect(coordinate.isValid(), isTrue);

      final coordinate2 = Coordinate(row: 8, col: 8);
      expect(coordinate2.isValid(), isTrue);
    });

    test('Should return False for invalid coordinates', () {
      final coordinate = Coordinate(row: -1, col: 0);
      expect(coordinate.isValid(), isFalse);

      final coordinate2 = Coordinate(row: 8, col: 9);
      expect(coordinate2.isValid(), isFalse);

      final coordinate3 = Coordinate(row: 10, col: 10);
      expect(coordinate3.isValid(), isFalse);
    });
  });
}