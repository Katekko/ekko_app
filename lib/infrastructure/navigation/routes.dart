import 'bindings/domains/auth.repository.binding.dart';

class Routes {
  static Future<String> get initialRoute async {
    try {
      final authDomainService = AuthRepositoryBinding().repository;
      final authenticated = await authDomainService.isAuthenticated();
      return !authenticated ? login : home;
    } catch (err) {
      return login;
    }
  }

  static const home = '/home';
  static const login = '/login';
}
