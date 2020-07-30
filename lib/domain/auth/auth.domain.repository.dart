import 'package:flutter/foundation.dart';
import 'package:social_app/infrastructure/dal/services/auth/auth.service.dart';

class AuthDomainRepository {
  AuthService _authService;
  AuthDomainRepository({@required AuthService authService}) {
    _authService = authService;
  }
}
