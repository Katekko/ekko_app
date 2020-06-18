import 'package:logger/logger.dart';

class DefaultException implements Exception {
  final String message;
  final StackTrace _stackTrace;

  DefaultException(this._stackTrace, {this.message = 'Unknow Error!'}) {
    Logger().e(_stackTrace);
  }

  String toString() {
    return 'DefaultException: $message';
  }
}
