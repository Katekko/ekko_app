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
    GetConnect connect = Get.find();
    GetStorage storage = Get.find();

    var authService = AuthService(connect: connect);
    var userService = UserService(connect: connect);
    var authDomainRepository = AuthDomainRepository(
      authService: authService,
      userService: userService,
      storage: storage,
    );
    _authDomainService = AuthDomainService(repository: authDomainRepository);
  }
}
