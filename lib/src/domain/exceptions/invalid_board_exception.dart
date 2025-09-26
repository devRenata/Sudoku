import 'package:sudoku/src/domain/exceptions/app_exception.dart';

class InvalidBoardException extends AppException {
  InvalidBoardException({required super.message});
}