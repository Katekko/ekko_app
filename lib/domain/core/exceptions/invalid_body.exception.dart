import 'package:logger/logger.dart';

class InvalidBodyException implements Exception {
  final String message;
  InvalidBodyException({required this.message}) {
    Logger().w(message);
  }

  String toString() => message;
}
