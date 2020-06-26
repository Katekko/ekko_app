import 'package:arctekko/infrastructure/navigation/bindings/domains/todo.domain.bindings.dart';
import 'package:arctekko/presentation/home/controllers/home.controller.dart';
import 'package:get/get.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    var todoDomainBinding = TodoDomainBinding();
    Get.lazyPut<HomeController>(
      () => HomeController(
        todoDomainBinding.domainService,
        screenArgs: Get.arguments,
      ),
    );
  }
}
