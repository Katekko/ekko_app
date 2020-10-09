import 'package:logger/logger.dart';
 
class TimeOutException implements Exception {
  final String message;
  final StackTrace stackTrace;
  TimeOutException({
    this.message = 'Timeout ao se tentar conectar n servidor',
    this.stackTrace,
  }) {
    Logger().e(stackTrace);
  }
 
  String toString() {
    return '$message';
  }
}
 
 

