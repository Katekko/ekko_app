import 'package:arctekko/domain/todo/models/todo.model.dart';
import 'package:arctekko/domain/todo/todo.domain.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EdtTodoStore extends GetxController {
  TextEditingController _titleController;
  TextEditingController _descController;
  TodoModel todo;

  EdtTodoStore(
    TodoDomainService todoDomainService, {
    Map screenArgs,
  }) {
    _titleController = TextEditingController();
    _descController = TextEditingController();

    var todo = screenArgs['todo'] as TodoModel;
    _titleController.text = todo.title;
    _descController.text = todo.desc;
    this.todo = todo;
  }

  TextEditingController get titleController => _titleController;
  TextEditingController get descController => _descController;
}
