import 'dart:convert';

import 'package:arctekko/domain/todo/todo.domain.repository.dart';

import 'models/todo.model.dart';

class TodoDomainService {
  TodoDomainRepository _repository;
  TodoDomainService(this._repository);

  Future<List<TodoModel>> fetchTodoList() async {
    try {
      return await _repository.getTodos();
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
}
