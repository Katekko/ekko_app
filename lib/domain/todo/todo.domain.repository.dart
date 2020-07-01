import 'package:arctekko/common/exceptions/default.exception.dart';
import 'package:arctekko/domain/todo/models/todo.model.dart';
import 'package:arctekko/infrastructure/dal/dao/todo.dao.dart';

class TodoDomainRepository {
  Future<List<TodoDao>> getTodos() async {
    try {
      return await TodoDao.getAll();
    } catch (err, stacktrace) {
      throw DefaultException(stacktrace);
    }
  }

  Future<void> saveTodo(TodoModel todo) async {
    try {
      await todo.save();
    } catch (err, stacktrace) {
      throw DefaultException(stacktrace);
    }
  }

  Future<void> deleteTodo(TodoModel todo) async {
    try {
      await todo.delete();
    } catch (err, stacktrace) {
      throw DefaultException(stacktrace);
    }
  }
}
