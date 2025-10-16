import 'package:flutter_test/flutter_test.dart';

import 'domain/entities/cell_test.dart' as cell_test;
import 'domain/entities/board_test.dart' as board_test;
import 'domain/value_objects/coordinate_test.dart' as coordinate_test;
import 'domain/value_objects/difficulty_test.dart' as difficulty_test; 

void main() {
  group('Domain unit tests |', () {
    cell_test.main();
    board_test.main();
    coordinate_test.main();
    difficulty_test.main();
  });
}