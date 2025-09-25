class Cell {
  final bool isEditable;
  final int solution;
  final int value;

  Cell({
    required this.isEditable,
    required this.solution,
    required this.value,
  });

  bool get isCorrect => value == solution;

  @override
  String toString() {
    return value.toString();
  }
}
