import 'package:ekko/domain/auth/models/token.model.dart';
import 'package:ekko/domain/auth/models/user.model.dart';

import 'auth.domain.repository.dart';

class AuthDomainService {
  final AuthDomainRepository _repository;
  const AuthDomainService({required AuthDomainRepository repository})
      : _repository = repository;

  Future<UserModel> authenticateUser({
    required String login,
    required String password,
  }) async {
    try {
      final response = await _repository.validateUserPassword(
        login: login,
        password: password,
      );

      final token = TokenModel.fromData(response.token);
      token.save();

      final user = UserModel.fromData(response.user);
      user.save();

      return user;
    } catch (err) {
      rethrow;
    }
  }

  Future<UserModel> getUser() async {
    try {
      final response = await _repository.getUserInfo();
      final user = UserModel.fromData(response);
      user.save();
      return user;
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> isAuthenticated() async {
    try {
      final hasToken = _repository.hasToken();
      if (hasToken) {
        final tokenData = _repository.getAuthToken();
        if (tokenData != null) {
          final token = TokenModel.fromData(tokenData);
          token.save();
        }
      }

      final hasUser = _repository.hasUserSaved();
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
