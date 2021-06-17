import 'package:ekko/domain/auth/models/user.model.dart';
import 'package:ekko/domain/core/constants/storage.constants.dart';
import 'package:ekko/infrastructure/dal/services/auth/auth.service.dart';
import 'package:ekko/infrastructure/dal/services/auth/dto/authenticate_user.body.dart';
import 'package:ekko/infrastructure/dal/services/user/user.service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthRepository {
  final AuthService _authService;
  final UserService _userService;
  final _storage = Get.find<GetStorage>();

  AuthRepository({
    required AuthService authService,
    required UserService userService,
  })  : _authService = authService,
        _userService = userService;

  Future<UserModel> authenticateUser({
    required String login,
    required String password,
  }) async {
    try {
      final body = AuthenticateUserBody(login: login, password: password);
      final response = await _authService.authenticateUser(body);

      final user = UserModel.fromData(response.data!.user);
      await user.save();

      await _storage.write(
        StorageConstants.TOKEN_AUTHORIZATION,
        response.data!.token,
      );

      return user;
    } catch (err) {
      rethrow;
    }
  }

  Future<UserModel> getUser() async {
    try {
      final response = await _userService.getUserInfo();
      final user = UserModel.fromData(response.data!.user);
      user.save();
      return user;
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> isAuthenticated() async {
    try {
      final hasToken = _storage.hasData(StorageConstants.TOKEN_AUTHORIZATION);
      final hasUser = _storage.hasData(StorageConstants.USER);
      return hasToken && hasUser;
    } catch (err) {
      rethrow;
    }
  }

  Future<void> logoutUser() async {
    try {
      await _storage.erase();
    } catch (err) {
      rethrow;
    }
  }
}
