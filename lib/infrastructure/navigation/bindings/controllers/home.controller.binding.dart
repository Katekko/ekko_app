import 'package:ekko/infrastructure/navigation/bindings/domains/auth.repository.binding.dart';
import 'package:ekko/presentation/home/controllers/home.controller.dart';
import 'package:get/get.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    final authRepositoryBinding = AuthRepositoryBinding();

    Get.lazyPut<HomeController>(
      () => HomeController(authRepository: authRepositoryBinding.repository),
    );
  }
}
