import 'package:arctekko/domain/core/exceptions/default.exception.dart';
import 'package:arctekko/domain/core/exceptions/user_not_found.exception.dart';
import 'package:arctekko/infrastructure/translate/login.translate.dart';
import 'package:flutter/foundation.dart';

import '../base.service.dart';
import 'dto/authenticate_user.body.dart';
import 'dto/authenticate_user.response.dart';

class AuthService {
  final BaseService _base;
  AuthService({@required BaseService base}) : _base = base;

  Future<AuthenticateUserResponse> authenticateUser(
    AuthenticateUserBody body,
  ) async {
    var response = await _base.post(
      'auth/login',
      body: body.toJson(),
    );

    if (!response.hasError) {
      var model = AuthenticateUserResponse.fromJson(response.body);
      return model;
    } else {
      switch (response.statusCode) {
        case 404:
          throw UserNotFoundException(
            message: LoginTranslate.userPasswordWrongSnackbar,
          );
        default:
          throw DefaultException(message: response.statusText);
      }
    }
  }
}
