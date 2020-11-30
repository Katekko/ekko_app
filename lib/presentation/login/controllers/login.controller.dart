import 'package:arctekko/domain/auth/auth.domain.service.dart';
import 'package:arctekko/domain/core/exceptions/user_not_found.exception.dart';
import 'package:arctekko/domain/core/utils/snackbar.util.dart';
import 'package:arctekko/infrastructure/navigation/routes.dart';
import 'package:arctekko/presentation/shared/loading/loading.controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthDomainService _authDomainService;
  final LoadingController _loadingController;
  LoginController({
    @required AuthDomainService authDomainService,
    @required LoadingController loadingController,
  })  : _authDomainService = authDomainService,
        _loadingController = loadingController;

  @override
  void onInit() {
    super.onInit();
    ever<String>(login, validateLogin);
    ever<String>(password, validatePassword);
  }

  Future<void> doLogin() async {
    try {
      _loadingController.isLoading = true;
      if (validateFields()) {
        await _authDomainService.authenticateUser(
          login: login.value,
          password: password.value,
        );

        Get.offAllNamed(Routes.HOME);
      }
    } on UserNotFoundException catch (err) {
      SnackbarUtil.showWarning(message: err.toString());
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
    } finally {
      _loadingController.isLoading = false;
    }
  }

  bool validateFields() {
    validateLogin(password.value);
    validatePassword(password.value);

    return enableButton;
  }

  final login = ''.obs;
  final loginError = RxString();
  final loginFocus = FocusNode();
  void validateLogin(String val) {
    if (val.isEmpty) {
      loginError.value = 'Digite seu login';
    } else if (val.length < 3) {
      loginError.value = 'Login inválido';
    } else {
      loginError.nil();
    }
  }

  final password = ''.obs;
  final passwordError = RxString();
  final passwordFocus = FocusNode();
  void validatePassword(String val) {
    if (val.isEmpty) {
      passwordError.value = 'Digite sua senha';
    } else if (val.length < 3) {
      passwordError.value = 'Senha inválida, no mínimo 3 caracters.';
    } else {
      passwordError.nil();
    }
  }

  bool get enableButton =>
      !login.value.isNullOrBlank &&
      loginError.value.isNullOrBlank &&
      !password.value.isNullOrBlank &&
      passwordError.value.isNullOrBlank;
}
