import 'package:get/get.dart';

class LoginTranslate {
  static const _INITIAL = 'home';

  static const _APP_BAR = '$_INITIAL-app-bar';
  static String get appBar => _APP_BAR.tr;

  static const _USER_NOT_FOUND_SNACKBAR = '$_INITIAL-user-not-found-snackbar';
  static String get userNotFoundSnackbar => _USER_NOT_FOUND_SNACKBAR.tr;

  static Map<String, String> translatePTBR = {
    _APP_BAR: 'Bem vindo ao Login',
    _USER_NOT_FOUND_SNACKBAR: 'Usuario e/ou senha incorretos!'
  };

  static Map<String, String> translateEN = {
    _APP_BAR: 'Welcome to Login',
    _USER_NOT_FOUND_SNACKBAR: 'User and/or password wrongs!!'
  };
}
