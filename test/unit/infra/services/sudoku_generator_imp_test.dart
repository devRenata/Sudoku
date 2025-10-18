import 'package:flutter_test/flutter_test.dart';
import 'package:sudoku/src/domain/services/i_sudoku_generator.dart';
import 'package:sudoku/src/domain/value_objects/difficulty.dart';
import 'package:sudoku/src/infra/services/sudoku_generator_imp.dart';

void main() {
  late ISudokuGenerator generator;

  setUp(() {
    generator = SudokuGeneratorImp();
  });

  group('Generator Service |', () {
    test('Must create a valid 9x9 board', () {
      final board = generator.generate(difficulty: Difficulty.easy);

      expect(board.cells.length, 9);
      for (final row in board.cells) {
        expect(row.length, 9);
      }

      for (int row = 0; row < 9; row++) {
        for (int col = 0; col < 9; col++) {
          final value = board.cells[row][col].value;
          final solution = board.cells[row][col].solution;

          expect(value, inInclusiveRange(0, 9));
          expect(solution, inInclusiveRange(1, 9));

          if (value != 0) {
            for (int c = 0; c < 9; c++) {
              if (c != col) expect(board.cells[row][c].value, isNot(value));
            }
            for (int r = 0; r < 9; r++) {
              if (r != row) expect(board.cells[r][col].value, isNot(value));
            }

            final startRow = (row ~/ 3) * 3;
            final startCol = (col ~/ 3) * 3;
            for (int r = startRow; r < startRow + 3; r++) {
              for (int c = startCol; c < startCol + 3; c++) {
                if (r != row || c != col) {
                  expect(board.cells[r][c].value, isNot(value));
                }
              }
            }
          }
        }
      }
    });

    test('Must create a board with the correct number of clues', () {
      final board = generator.generate(difficulty: Difficulty.medium);

      int filledCount = 0;
      for (final row in board.cells) {
        for (final cell in row) {
          if (cell.value != 0) filledCount++;
        }
      }

      expect(filledCount, equals(Difficulty.medium.clues));
    });

    test('Must generate different boards in consecutive runs', () {
      final board1 = generator.generate(difficulty: Difficulty.hard);
      final board2 = generator.generate(difficulty: Difficulty.hard);

      bool areDifferent = false;
      for (int r = 0; r < 9; r++) {
        for (int c = 0; c < 9; c++) {
          if (board1.cells[r][c].value != board2.cells[r][c].value) {
            areDifferent = true;
            break;
          }
        }
      }

      expect(areDifferent, isTrue);
    });
  });
}