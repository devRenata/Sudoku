class Difficulty {
  final String name;
  final int clues;

  const Difficulty._(this.name, this.clues);

  static const easy = Difficulty._('Easy', 32);
  static const medium = Difficulty._('Medium', 28);
  static const hard = Difficulty._('Hard', 24);

  @override
  String toString() => name;
}