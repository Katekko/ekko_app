import 'package:ekko/domain/core/abstractions/http_connect.interface.dart';
import 'package:ekko/domain/core/exceptions/default.exception.dart';
import 'package:ekko/domain/core/exceptions/user_not_found.exception.dart';
import 'package:ekko/infrastructure/translate/login.translate.dart';

import 'dto/authenticate_user.body.dart';
import 'dto/authenticate_user.response.dart';

class AuthService {
  final IHttpConnect _connect;
  const AuthService(IHttpConnect connect) : _connect = connect;

  String get _prefix => 'auth';

  Future<AuthenticateUserResponse> authenticateUser(
    AuthenticateUserBody body,
  ) async {
    final response = await _connect.post(
      '$_prefix/login',
      body.toJson(),
      decoder: (value) => AuthenticateUserResponse.fromJson(
        value as Map<String, dynamic>,
      ),
    );

    if (response.success) {
      return response.payload!;
    } else {
      switch (response.statusCode) {
        case 404:
          throw UserNotFoundException(
            message: LoginTranslate.userPasswordWrongSnackbar,
          );
        default:
          throw DefaultException(message: response.payload!.error!);
      }
    }
  }
}
