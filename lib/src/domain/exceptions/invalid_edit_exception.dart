import 'package:sudoku/src/domain/exceptions/app_exception.dart';

class InvalidEditException extends AppException {
  InvalidEditException({required super.message});
}