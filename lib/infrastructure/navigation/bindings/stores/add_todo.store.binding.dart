import 'package:arctekko/infrastructure/navigation/bindings/domains/todo.domain.bindings.dart';
import 'package:arctekko/presentation/add_todo/store/add_todo.store.dart';
import 'package:get/get.dart';

class AddTodoStoreBinding extends Bindings {
  @override
  void dependencies() {
    var todoDomainBinding = TodoDomainBinding();
    Get.lazyPut<AddTodoStore>(
      () => AddTodoStore(
        todoDomainBinding.domainService,
        screenArgs: Get.arguments,
      ),
    );
  }
}
