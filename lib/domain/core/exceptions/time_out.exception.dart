import 'package:logger/logger.dart';

class TimeOutException implements Exception {
  final String message;
  TimeOutException({
    this.message = 'Timeout ao se tentar conectar n servidor',
  }) {
    Logger().w(message);
  }

  @override
  String toString() => message;
}
