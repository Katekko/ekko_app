import 'package:arctekko/domain/todo/models/todo.model.dart';
import 'package:arctekko/domain/todo/todo.domain.service.dart';
import 'package:get/get.dart';

class HomeStore extends RxController {
  TodoDomainService _todoDomainService;
  HomeStore(
    this._todoDomainService, {
    Map<String, dynamic> screenArgs,
  });

  @override
  void onInit() async {
    await fetchTodoList();
  }

  Future<void> fetchTodoList() async {
    try {
      var tl = await _todoDomainService.fetchTodoList();
      todoList.assignAll(tl);
    } catch (err) {
      rethrow;
    }
  }

  Future<void> addTodo(TodoModel todo) async {
    try {
      await _todoDomainService.addTodo(todo);
      todoList.add(todo);
    } catch (err) {
      rethrow;
    }
  }

  // TODO: Fazer o editar TODO
  // TODO: Fazer o excluir TODO

  final todoList = <TodoModel>[].obs;
}
