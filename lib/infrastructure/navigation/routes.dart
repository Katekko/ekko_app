import 'bindings/domains/auth.domain.binding.dart';

class Routes {
  static Future<String> get initialRoute async {
    try {
      final authDomainService = AuthDomainBinding().domain;
      final authenticated = await authDomainService!.isAuthenticated();
      return !authenticated ? LOGIN : HOME;
    } catch (err) {
      return LOGIN;
    }
  }

  static const HOME = '/home';
  static const LOGIN = '/login';
}
