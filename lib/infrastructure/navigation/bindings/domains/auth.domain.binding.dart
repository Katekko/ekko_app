import 'package:arctekko/domain/auth/auth.domain.repository.dart';
import 'package:arctekko/domain/auth/auth.domain.service.dart';
import 'package:arctekko/infrastructure/dal/services/auth/auth.service.dart';
import 'package:arctekko/infrastructure/dal/services/base.service.dart';
import 'package:arctekko/infrastructure/dal/services/user/user.service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthDomainBinding {
  AuthDomainService _authDomainService;
  AuthDomainService get domain => _authDomainService;

  AuthDomainBinding() {
    GetConnect connect = Get.find();
    GetStorage storage = Get.find();

    final baseService = BaseService(connect: connect, storage: storage);
    var authService = AuthService(base: baseService);
    var userService = UserService(base: baseService);
    var authDomainRepository = AuthDomainRepository(
      authService: authService,
      userService: userService,
    );
    _authDomainService = AuthDomainService(repository: authDomainRepository);
  }
}
