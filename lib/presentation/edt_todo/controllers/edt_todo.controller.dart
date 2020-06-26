import 'package:arctekko/domain/todo/models/todo.model.dart';
import 'package:arctekko/domain/todo/todo.domain.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EdtTodoController extends GetxController {
  TodoModel todo;

  EdtTodoController(
    TodoDomainService todoDomainService, {
    Map screenArgs,
  }) {
    var todo = screenArgs['todo'] as TodoModel;
    this.todo = todo;
  }

  void onChangeTitle(String val) => todo.title = val;
  void onChangeDescription(String val) => todo.desc = val;
}
