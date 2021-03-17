import 'package:logger/logger.dart';

class InternetFailedException implements Exception {
  final String message;

  InternetFailedException({
    this.message = 'Falha ao conectar com o servidor!',
  }) {
    Logger().w(message);
  }

  @override
  String toString() => message;
}
