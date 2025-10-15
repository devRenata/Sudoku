class Coordinate {
  final int row;
  final int col;

  Coordinate({required this.row, required this.col});

  bool isValid() => row >= 0 && row < 9 && col >= 0 && col < 9;
}