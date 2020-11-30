import 'package:arctekko/domain/core/exceptions/default.exception.dart';
import 'package:arctekko/infrastructure/dal/services/auth/auth.service.dart';
import 'package:arctekko/infrastructure/dal/services/auth/dto/authenticate_user.body.dart';
import 'package:arctekko/infrastructure/dal/services/auth/dto/authenticate_user.response.dart';
import 'package:arctekko/infrastructure/dal/services/data/user.data.dart';
import 'package:arctekko/infrastructure/dal/services/user/user.service.dart';
import 'package:flutter/foundation.dart';

class AuthDomainRepository {
  final AuthService _authService;
  final UserService _userService;

  const AuthDomainRepository({
    @required AuthService authService,
    @required UserService userService,
  })  : _authService = authService,
        _userService = userService;

  Future<DataResponse> validateUserPassword({
    @required String login,
    @required String password,
  }) async {
    try {
      var body = AuthenticateUserBody(login: login, password: password);
      var response = await _authService.authenticateUser(body);
      if (response.success) {
        return response.data;
      } else {
        throw DefaultException(message: response.error);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<UserData> getUser() async {
    try {
      var response = await _userService.getUserInfo();
      if (response.success) {
        return response.data.user;
      } else {
        throw DefaultException(message: response.error);
      }
    } catch (err) {
      rethrow;
    }
  }
}
