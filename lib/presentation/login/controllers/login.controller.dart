import 'package:arctekko/domain/auth/auth.domain.service.dart';
import 'package:arctekko/domain/auth/models/user.model.dart';
import 'package:arctekko/domain/core/exceptions/user_not_found.exception.dart';
import 'package:arctekko/domain/core/utils/snackbar.util.dart';
import 'package:arctekko/presentation/shared/loading/loading.controller.dart';
import 'package:flutter/foundation.dart';
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
  void onInit() async {
    super.onInit();
    try {
      _loadingController.isLoading = true;
      var user = await _authDomainService.authenticateUser(
        login: 'contato@gyanburuworld.com',
        password: '123456',
      );

      this.user.value = user;
    } on UserNotFoundException catch (err) {
      SnackbarUtil.showWarning(message: err.toString());
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
    } finally {
      _loadingController.isLoading = false;
    }
  }

  final user = Rx<UserModel>();
}
