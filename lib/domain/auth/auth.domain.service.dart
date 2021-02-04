import 'package:arctekko/domain/auth/models/token.model.dart';
import 'package:arctekko/domain/auth/models/user.model.dart';
import 'package:flutter/foundation.dart';

import 'auth.domain.repository.dart';

class AuthDomainService {
  final AuthDomainRepository _repository;
  const AuthDomainService({@required AuthDomainRepository repository})
      : _repository = repository;

  Future<UserModel> authenticateUser({
    @required String login,
    @required String password,
  }) async {
    try {
      var response = await _repository.validateUserPassword(
        login: login,
        password: password,
      );

      var token = TokenModel.fromData(response.token);
      token.save();

      var user = UserModel.fromData(response.user);
      user.save();

      return user;
    } catch (err) {
      rethrow;
    }
  }

  Future<UserModel> getUser() async {
    try {
      var response = await _repository.getUserInfo();
      var user = UserModel.fromData(response);
      user.save();
      return user;
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> isAuthenticated() async {
    try {
      var hasToken = _repository.hasToken();
      if (hasToken) {
        var tokenData = _repository.getAuthToken();
        var token = TokenModel.fromData(tokenData);
        token.save();
      }

      var hasUser = _repository.hasUserSaved();
      if (hasToken && hasUser) {
        return true;
      } else {
        await logoutUser();
      }
      return hasToken && hasUser;
    } catch (err) {
      rethrow;
    }
  }

  Future<void> logoutUser() async {
    try {
      _repository.clearDatabase();
      _repository.clearStorage();
    } catch (err) {
      rethrow;
    }
  }
}
