class Cell {
  final int solution;
  final int? value;
  final bool isEditable;

  Cell({
    required this.solution,
    required this.value,
    required this.isEditable,
  });

  bool get isCorrect => value == solution;
}
