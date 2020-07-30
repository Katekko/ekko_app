class Routes {
  static Future<String> get initialRoute async {
    // var authDomain = AuthDomainBinding().domain;
    // if (authDomain.isAutenticado()) return HOME;
    return LOGIN;
  }

  static const LOGIN = 'login';
}
