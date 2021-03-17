import 'package:ekko/domain/auth/auth.domain.service.dart';
import 'package:ekko/domain/core/exceptions/user_not_found.exception.dart';
import 'package:ekko/domain/core/utils/snackbar.util.dart';
import 'package:ekko/infrastructure/navigation/routes.dart';
import 'package:ekko/presentation/shared/loading/loading.controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final AuthDomainService _authDomainService;
  final LoadingController _loadingController;
  LoginController({
    required AuthDomainService authDomainService,
    required LoadingController loadingController,
  })   : _authDomainService = authDomainService,
        _loadingController = loadingController;

  @override
  void onInit() {
    super.onInit();
    ever<String>(login as RxInterface<String>, validateLogin);
    ever<String>(password as RxInterface<String>, validatePassword);
  }

  Future<void> doLogin() async {
    try {
      _loadingController.isLoading = true;
      if (validateFields()) {
        Get.focusScope?.unfocus();

        await _authDomainService.authenticateUser(
          login: login.value!,
          password: password.value!,
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
    validateLogin(login.value!);
    validatePassword(password.value!);

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
      loginError.value = null;
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
      passwordError.value = null;
    }
  }

  bool get enableButton =>
      login.isNotEmpty &&
      password.isNotEmpty &&
      loginError.value != null &&
      passwordError.value != null;
}
