import 'package:arctekko/domain/todo/todo.domain.repository.dart';

import 'models/todo.model.dart';

class TodoDomainService {
  TodoDomainRepository _repository;
  TodoDomainService(this._repository);

  Future<List<TodoModel>> fetchTodoList() async {
    try {
      var todos = await _repository.getTodos();
      return todos.map<TodoModel>((e) => TodoModel.fromDao(e)).toList();
    } catch (err) {
      rethrow;
    }
  }

  Future<void> addTodo(TodoModel todo) async {
    try {
      await _repository.saveTodo(todo);
    } catch (err) {
      rethrow;
    }
  }

  Future<void> removeTodo(TodoModel todo) async {
    try {
      await _repository.deleteTodo(todo);
    } catch (err) {
      rethrow;
    }
  }

  Future<void> editTodo(TodoModel todo) async {
    try {
      await _repository.saveTodo(todo);
    } catch (err) {
      rethrow;
    }
  }
}
