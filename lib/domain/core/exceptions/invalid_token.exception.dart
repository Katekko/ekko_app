import 'package:logger/logger.dart';

class InvalidTokenException implements Exception {
  final String message;
  final StackTrace stackTrace;
  InvalidTokenException({this.message = 'Invalid token!', this.stackTrace}) {
    Logger().e(stackTrace);
  }

  String toString() {
    return '$message';
  }
}
