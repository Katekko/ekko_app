import 'package:arctekko/common/utils/snackbar.util.dart';
import 'package:arctekko/domain/config/config.domain.service.dart';
import 'package:arctekko/domain/todo/models/todo.model.dart';
import 'package:arctekko/domain/todo/todo.domain.service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TodoDomainService _todoDomainService;
  ConfigDomainService _configDomainService;
  HomeController(
    this._todoDomainService,
    this._configDomainService, {
    Map<String, dynamic> screenArgs,
  });

  @override
  void onInit() async {
    try {
      await _configDomainService.loadAllConfigs();
      await fetchTodoList();
    } catch (err) {
      SnackbarUtil.showError(err.toString());
    }
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

  Future<void> removeTodo(TodoModel todo) async {
    try {
      await _todoDomainService.removeTodo(todo);
      todoList.remove(todo);
    } catch (err) {
      rethrow;
    }
  }

  Future<void> editeTodo(TodoModel todo) async {
    try {
      await _todoDomainService.addTodo(todo);
      var todoInList = todoList.firstWhere((t) => t.id == todo.id);
      var indexOfTodo = todoList.value.indexOf(todoInList);
      todoList[indexOfTodo] = todo;
    } catch (err) {
      rethrow;
    }
  }

  final todoList = <TodoModel>[].obs;
}
