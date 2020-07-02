import 'package:arctekko/infrastructure/navigation/bindings/domains/config.domain.bindings.dart';
import 'package:arctekko/infrastructure/navigation/bindings/domains/todo.domain.bindings.dart';
import 'package:arctekko/presentation/home/controllers/home.controller.dart';
import 'package:get/get.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    var todoDomainBinding = TodoDomainBinding();
    var configDomainBinding = ConfigDomainBinding();
    Get.lazyPut<HomeController>(
      () => HomeController(
        todoDomainBinding.domainService,
        configDomainBinding.domainService,
        screenArgs: Get.arguments,
      ),
    );
  }
}
