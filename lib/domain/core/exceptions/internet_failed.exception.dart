import 'package:logger/logger.dart';

class InternetFailedException implements Exception {
  final String message;
  final StackTrace stackTrace;
  InternetFailedException({this.message = 'Falha ao conectar com o servidor!', this.stackTrace}) {
    Logger().e(stackTrace);
  }

  String toString() {
    return '$message';
  }
}
