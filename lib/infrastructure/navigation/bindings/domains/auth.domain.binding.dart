import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:arctekko/domain/auth/auth.domain.repository.dart';
import 'package:arctekko/domain/auth/auth.domain.service.dart';
import 'package:arctekko/infrastructure/dal/services/auth/auth.service.dart';
import 'package:get_storage/get_storage.dart';

class AuthDomainBinding {
  AuthDomainService _authDomainService;
  AuthDomainService get domain => _authDomainService;

  AuthDomainBinding() {
    Dio dio = Get.find();
    GetStorage storage = Get.find();
    var authService = AuthService(dio);
    var authDomainRepository = AuthDomainRepository(
      authService: authService,
      storage: storage,
    );
    _authDomainService = AuthDomainService(repository: authDomainRepository);
  }
}
