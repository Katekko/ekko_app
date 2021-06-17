import 'package:ekko/domain/auth/auth.repository.dart';
import 'package:ekko/domain/auth/models/user.model.dart';
import 'package:ekko/domain/core/utils/snackbar.util.dart';
import 'package:ekko/presentation/shared/loading/loading.controller.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  final AuthRepository _authRepository;
  final _loadingController = Get.find<LoadingController>();

  HomeController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      _loadingController.isLoading = true;
      user.value = await _authRepository.getUser();
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
    } finally {
      _loadingController.isLoading = false;
    }
  }

  final user = Rxn<UserModel>();
}
