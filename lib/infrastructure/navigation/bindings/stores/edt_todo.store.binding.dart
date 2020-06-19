import 'package:arctekko/infrastructure/navigation/bindings/domains/todo.domain.bindings.dart';
import 'package:arctekko/presentation/edt_todo/store/edt_todo.store.dart';
import 'package:get/get.dart';

class EdtTodoStoreBinding extends Bindings {
  @override
  void dependencies() {
    var todoDomainBinding = TodoDomainBinding();
    Get.lazyPut<EdtTodoStore>(
      () => EdtTodoStore(
        todoDomainBinding.domainService,
        screenArgs: Get.arguments,
      ),
    );
  }
}
