import 'package:arctekko/domain/core/exceptions/default.exception.dart';
import 'package:arctekko/domain/core/exceptions/invalid_body.exception.dart';
import 'package:dio/dio.dart';

class ResponseUtil {
  static void verifyDioError(DioError err, StackTrace stackTrace) {
    switch (err?.response?.statusCode) {
      case 400:
        var error = err.response.data['error'];
        throw InvalidBodyException(message: error);
        break;
      case 500:
        var error = err.response.data['error'];
        throw DefaultException(message: error);
        break;
      default:
    }
  }
}
