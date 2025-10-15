import 'package:sudoku/src/domain/exceptions/app_exception.dart';

class CellConflictException extends AppException {
  CellConflictException({required super.message});
}