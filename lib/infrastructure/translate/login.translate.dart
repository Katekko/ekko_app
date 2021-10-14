import 'package:get/get.dart';

class LoginTranslate {
  static const _initial = 'home';

  static const _appBar = '$_initial-app-bar';
  static String get appBar => _appBar.tr;

  static const _userPasswordWrongSnackbar =
      '$_initial-user-password-wrong-snackbar';
  static String get userPasswordWrongSnackbar => _userPasswordWrongSnackbar.tr;

  static Map<String, String> translatePTBR = {
    _appBar: 'Bem vindo ao Login',
    _userPasswordWrongSnackbar: 'Usuario e/ou senha incorretos!'
  };

  static Map<String, String> translateEN = {
    _appBar: 'Welcome to Login',
    _userPasswordWrongSnackbar: 'User and/or password wrongs!!'
  };
}
