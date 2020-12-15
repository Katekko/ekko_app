// import 'package:arctekko/domain/core/exceptions/internet_failed.exception.dart';
// import 'package:arctekko/domain/core/exceptions/time_out.exception.dart';
// import 'package:dio/dio.dart';

// class ConnectionUtil {
//   static void verifyConnectionError(DioError err) {
//     if (err.type == DioErrorType.CONNECT_TIMEOUT) {
//       throw TimeOutException();
//     }

//     if (err.type == DioErrorType.DEFAULT) {
//       if (err.message.contains('Connection failed') ||
//           err.message.contains('Connection refused')) {
//         throw InternetFailedException();
//       }
//     }
//   }
// }
