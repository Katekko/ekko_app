import 'package:ekko/domain/auth/auth.domain.repository.dart';
import 'package:ekko/domain/auth/auth.domain.service.dart';
import 'package:ekko/infrastructure/dal/services/auth/auth.service.dart';
import 'package:ekko/infrastructure/dal/services/user/user.service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthDomainBinding {
  AuthDomainService? _authDomainService;
  AuthDomainService? get domain => _authDomainService;

  AuthDomainBinding() {
    final connect = Get.find<GetConnect>();
    final storage = Get.find<GetStorage>();

    final authService = AuthService(connect: connect);
    final userService = UserService(connect: connect);
    final authDomainRepository = AuthDomainRepository(
      authService: authService,
      userService: userService,
      storage: storage,
    );
    _authDomainService = AuthDomainService(repository: authDomainRepository);
  }
}
