import 'bindings/domains/auth.repository.binding.dart';

class Routes {
  static Future<String> get initialRoute async {
    try {
      final authDomainService = AuthRepositoryBinding().repository;
      final authenticated = await authDomainService.isAuthenticated();
      return !authenticated ? LOGIN : HOME;
    } catch (err) {
      return LOGIN;
    }
  }

  static const HOME = '/home';
  static const LOGIN = '/login';
}
