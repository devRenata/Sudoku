import 'package:sudoku/src/domain/exceptions/app_exception.dart';

class InvalidCoordinateException extends AppException {
  InvalidCoordinateException({required super.message});
}