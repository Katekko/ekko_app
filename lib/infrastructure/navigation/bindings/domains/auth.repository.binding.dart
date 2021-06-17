import 'package:ekko/domain/auth/auth.repository.dart';
import 'package:ekko/infrastructure/dal/services/auth/auth.service.dart';
import 'package:ekko/infrastructure/dal/services/user/user.service.dart';

class AuthRepositoryBinding {
  late AuthRepository _authRepository;
  AuthRepository get repository => _authRepository;

  AuthRepositoryBinding() {
    final authService = AuthService();
    final userService = UserService();
    _authRepository = AuthRepository(
      authService: authService,
      userService: userService,
    );
  }
}
