import 'package:arctekko/infrastructure/navigation/bindings/domains/todo.domain.bindings.dart';
import 'package:arctekko/presentation/edt_todo/controllers/edt_todo.controller.dart';
import 'package:get/get.dart';

class EdtTodoControllerBinding extends Bindings {
  @override
  void dependencies() {
    var todoDomainBinding = TodoDomainBinding();
    Get.lazyPut<EdtTodoController>(
      () => EdtTodoController(
        todoDomainBinding.domainService,
        screenArgs: Get.arguments,
      ),
    );
  }
}
