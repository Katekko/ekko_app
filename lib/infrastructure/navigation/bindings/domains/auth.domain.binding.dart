import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:social_app/domain/auth/auth.domain.repository.dart';
import 'package:social_app/domain/auth/auth.domain.service.dart';
import 'package:social_app/infrastructure/dal/services/auth/auth.service.dart';

class AuthDomainBinding {
  AuthDomainService _authDomainService;
  AuthDomainService get domain => _authDomainService;

  AuthDomainBinding() {
    Dio dio = Get.find();
    var authService = AuthService(dio);
    var authDomainRepository = AuthDomainRepository(authService: authService);
    _authDomainService = AuthDomainService(
      authDomainRepository: authDomainRepository,
    );
  }
}
