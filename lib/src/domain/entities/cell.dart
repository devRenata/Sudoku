import 'package:sudoku/src/domain/value_objects/coordinate.dart';

class Cell {
  final Coordinate coordinate;
  final bool isEditable;
  final int solution;
  int value;

  Cell({
    required this.coordinate,
    required this.isEditable,
    required this.solution,
    required this.value,
  });

  bool get isCorrect => value == solution;
  bool get isEmpty => value == 0;

  Cell copyWith({required int value}) {
    return Cell(
      coordinate: coordinate,
      isEditable: isEditable,
      solution: solution,
      value: value,
    );
  }

  @override
  String toString() {
    return value.toString();
  }
}
