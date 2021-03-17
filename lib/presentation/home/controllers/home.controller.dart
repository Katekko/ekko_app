import 'package:ekko/domain/auth/auth.domain.service.dart';
import 'package:ekko/domain/auth/models/user.model.dart';
import 'package:ekko/presentation/shared/loading/loading.controller.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  final AuthDomainService _authDomainService;
  final LoadingController _loadingController;

  HomeController({
    required AuthDomainService authDomainService,
    required LoadingController loadingController,
  })   : _authDomainService = authDomainService,
        _loadingController = loadingController;

  @override
  void onReady() async {
    super.onReady();
    try {
      _loadingController.isLoading = true;
      this.user.value = await _authDomainService.getUser();
    } catch (err) {} finally {
      _loadingController.isLoading = false;
    }
  }

  var user = Rx<UserModel>();
}
