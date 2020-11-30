import 'package:logger/logger.dart';

class UserNotFoundException implements Exception {
  final String message;
  final StackTrace stackTrace;
  UserNotFoundException({this.message = 'User not found!', this.stackTrace}) {
    Logger().e(stackTrace);
  }

  String toString() {
    return '$message';
  }
}
