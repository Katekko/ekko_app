import 'package:arctekko/domain/core/exceptions/default.exception.dart';
import 'package:arctekko/domain/core/exceptions/user_not_found.exception.dart';
import 'package:arctekko/infrastructure/translate/login.translate.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/connect.dart';

import 'dto/authenticate_user.body.dart';
import 'dto/authenticate_user.response.dart';

class AuthService {
  final GetConnect _connect;
  const AuthService({@required GetConnect connect}) : _connect = connect;

  Future<AuthenticateUserResponse> authenticateUser(
    AuthenticateUserBody body,
  ) async {
    var response = await _connect.post(
      'auth/login',
      body.toJson(),
    );

    if (!response.hasError) {
      var model = AuthenticateUserResponse.fromJson(response.body);
      return model;
    } else {
      switch (response.statusCode) {
        case 404:
          throw UserNotFoundException(
            message: LoginTranslate.userNotFoundSnackbar,
          );
        default:
          throw DefaultException(message: response.statusText);
      }
    }
  }
}
