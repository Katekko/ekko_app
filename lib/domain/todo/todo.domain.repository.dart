import 'package:arctekko/common/exceptions/default.exception.dart';
import 'package:arctekko/domain/todo/models/todo.model.dart';

class TodoDomainRepository {
  Future<List<TodoModel>> getTodos() async {
    try {
      return [];
    } catch (err, stacktrace) {
      throw DefaultException(stacktrace);
    }
  }

  Future<void> saveTodo(TodoModel todo) async {
    try {} catch (err, stacktrace) {
      throw DefaultException(stacktrace);
    }
  }

  Future<void> deleteTodo(TodoModel todo) async {
    try {} catch (err, stacktrace) {
      throw DefaultException(stacktrace);
    }
  }

  Future<void> updateTodo(TodoModel todo) async {
    try {} catch (err, stacktrace) {
      throw DefaultException(stacktrace);
    }
  }
}
