import 'package:ekko/domain/core/constants/storage.constants.dart';
import 'package:ekko/domain/core/exceptions/default.exception.dart';
import 'package:ekko/domain/core/mixins/dao.mixin.dart';
import 'package:ekko/infrastructure/dal/daos/user.dao.dart';
import 'package:ekko/infrastructure/dal/services/auth/auth.service.dart';
import 'package:ekko/infrastructure/dal/services/auth/data/token.data.dart';
import 'package:ekko/infrastructure/dal/services/auth/dto/authenticate_user.body.dart';
import 'package:ekko/infrastructure/dal/services/auth/dto/authenticate_user.response.dart';
import 'package:ekko/infrastructure/dal/services/data/user.data.dart';
import 'package:ekko/infrastructure/dal/services/user/user.service.dart';

import 'package:get_storage/get_storage.dart';

class AuthDomainRepository {
  final AuthService _authService;
  final UserService _userService;
  final GetStorage _storage;

  const AuthDomainRepository({
    required AuthService authService,
    required UserService userService,
    required GetStorage storage,
  })   : _authService = authService,
        _userService = userService,
        _storage = storage;

  Future<DataResponse> validateUserPassword({
    required String login,
    required String password,
  }) async {
    try {
      var body = AuthenticateUserBody(login: login, password: password);
      var response = await _authService.authenticateUser(body);
      if (response.success) {
        return response.data!;
      } else {
        throw DefaultException(message: response.error);
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<UserData> getUserInfo() async {
    try {
      var response = await _userService.getUserInfo();
      if (response.success) {
        return response.data!.user;
      } else {
        throw DefaultException(message: response.error);
      }
    } catch (err) {
      rethrow;
    }
  }

  bool hasToken() {
    try {
      return _storage.hasData(StorageConstants.TOKEN_AUTHORIZATION);
    } catch (err) {
      rethrow;
    }
  }

  TokenData getAuthToken() {
    try {
      final token = _storage.read(StorageConstants.TOKEN_AUTHORIZATION);
      return TokenData(token);
    } catch (err) {
      rethrow;
    }
  }

  UserDao getSavedUser() {
    try {
      var users = BaseDao.selectAll<UserDao>();
      return users.first;
    } catch (err) {
      rethrow;
    }
  }

  bool hasUserSaved() {
    try {
      var users = BaseDao.selectAll<UserDao>();
      return users.isNotEmpty;
    } catch (err) {
      rethrow;
    }
  }

  Future<void> clearStorage() async {
    try {
      await _storage.erase();
    } catch (err) {
      rethrow;
    }
  }

  void clearDatabase() {
    try {
      BaseDao.clear<UserDao>();
    } catch (err) {
      rethrow;
    }
  }
}
