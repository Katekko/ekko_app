import 'package:ekko/domain/auth/auth.repository.dart';
import 'package:ekko/infrastructure/dal/connect.dart';
import 'package:ekko/infrastructure/dal/services/auth/auth.service.dart';
import 'package:ekko/infrastructure/dal/services/user/user.service.dart';
import 'package:get/get.dart';

class AuthRepositoryBinding {
  late AuthRepository _authRepository;
  AuthRepository get repository => _authRepository;

  AuthRepositoryBinding() {
    final getConnect = Get.find<GetConnect>();
    final connect = Connect(connect: getConnect);
    final authService = AuthService(connect);
    final userService = UserService(connect);
    _authRepository = AuthRepository(
      authService: authService,
      userService: userService,
    );
  }
}
