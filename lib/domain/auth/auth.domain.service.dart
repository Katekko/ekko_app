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
      await user.save();

      return user;
    } catch (err) {
      rethrow;
    }
  }

  Future<UserModel> getUser() async {
    try {
      var response = await _repository.getUser();
      var user = UserModel.fromData(response);
      await user.save();
      return user;
    } catch (err) {
      rethrow;
    }
  }
}
