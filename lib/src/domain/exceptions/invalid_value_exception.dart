import 'package:sudoku/src/domain/exceptions/app_exception.dart';

class InvalidValueException extends AppException {
  InvalidValueException({required super.message});
}