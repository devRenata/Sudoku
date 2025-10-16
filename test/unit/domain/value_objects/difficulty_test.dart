import 'package:flutter_test/flutter_test.dart';
import 'package:sudoku/src/domain/value_objects/difficulty.dart';

void main() {
  group('Difficulty Value Object |', () {
    test('Instances must have correct values', () {
      expect(Difficulty.easy.name.toLowerCase(), 'easy');
      expect(Difficulty.easy.clues, equals(32));

      expect(Difficulty.medium.name.toLowerCase(), 'medium');
      expect(Difficulty.medium.clues, equals(28));

      expect(Difficulty.hard.name.toLowerCase(), 'hard');
      expect(Difficulty.hard.clues, equals(24));
    });
  });
}