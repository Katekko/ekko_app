import 'package:arctekko/infrastructure/navigation/bindings/domains/todo.domain.bindings.dart';
import 'package:arctekko/presentation/add_todo/controllers/add_todo.controller.dart';
import 'package:get/get.dart';

class AddTodoControllerBinding extends Bindings {
  @override
  void dependencies() {
    var todoDomainBinding = TodoDomainBinding();
    Get.lazyPut<AddTodoController>(
      () => AddTodoController(
        todoDomainBinding.domainService,
        screenArgs: Get.arguments,
      ),
    );
  }
}
