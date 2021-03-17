import 'package:logger/logger.dart';

class UserNotFoundException implements Exception {
  final String message;
  UserNotFoundException({this.message = 'User not found!'}) {
    Logger().w(message);
  }

  @override
  String toString() => message;
}
