import 'package:arctekko/domain/todo/todo.domain.service.dart';
import 'package:get/get.dart';

class AddTodoController extends GetxController {
  AddTodoController(
    TodoDomainService todoDomainService, {
    Map screenArgs,
  });

  final _title = ''.obs;
  String get title => _title.value;
  void onChangeTitle(String val) => _title.value = val;

  final _desc = ''.obs;
  String get description => _desc.value;
  void onChangeDescription(String val) => _desc.value = val;
}
