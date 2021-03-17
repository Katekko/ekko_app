import 'package:ekko/infrastructure/navigation/bindings/domains/auth.domain.binding.dart';
import 'package:get/get.dart';

import './../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    final authDomainBinding = AuthDomainBinding();

    Get.lazyPut<HomeController>(
      () => HomeController(
        authDomainService: authDomainBinding.domain!,
        loadingController: Get.find(),
      ),
    );
  }
}
