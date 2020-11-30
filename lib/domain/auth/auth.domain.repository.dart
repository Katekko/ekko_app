import 'package:arctekko/domain/core/exceptions/default.exception.dart';
import 'package:arctekko/infrastructure/dal/services/auth/dto/authenticate_user.body.dart';
import 'package:arctekko/infrastructure/dal/services/auth/dto/authenticate_user.response.dart';
import 'package:flutter/foundation.dart';
import 'package:arctekko/infrastructure/dal/services/auth/auth.service.dart';
import 'package:get_storage/get_storage.dart';

class AuthDomainRepository {
  final AuthService _authService;
  // ignore: unused_field
  final GetStorage _storage;

  const AuthDomainRepository({
    @required AuthService authService,
    @required GetStorage storage,
  })  : _authService = authService,
        _storage = storage;

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
}
