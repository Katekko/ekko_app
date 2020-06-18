import 'package:arctekko/infrastructure/navigation/bindings/domains/todo.domain.bindings.dart';
import 'package:arctekko/presentation/home/store/home.store.dart';
import 'package:get/get.dart';

class HomeStoreBinding extends Bindings {
  @override
  void dependencies() {
    var todoDomainBinding = TodoDomainBinding();
    Get.lazyPut<HomeStore>(
      () => HomeStore(
        todoDomainBinding.domainService,
        screenArgs: Get.arguments,
      ),
    );
  }
}
