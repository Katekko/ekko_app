import 'package:get/get.dart';

class LoginTranslate {
  static const _INITIAL = 'home';
  static const _APP_BAR = '$_INITIAL-app-bar';
  static String get appBar => _APP_BAR.tr;

  static Map<String, String> translatePTBR = {
    _APP_BAR: 'Bem vindo ao Login',
  };

  static Map<String, String> translateEN = {
    _APP_BAR: 'Welcome to Login',
  };
}
