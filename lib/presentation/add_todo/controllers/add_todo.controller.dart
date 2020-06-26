import 'package:arctekko/domain/todo/todo.domain.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddTodoController extends GetxController {
  TextEditingController _titleController;
  TextEditingController _descController;
  AddTodoController(
    TodoDomainService todoDomainService, {
    Map screenArgs,
  }) {
    _titleController = TextEditingController();
    _descController = TextEditingController();
  }

  TextEditingController get titleController => _titleController;
  TextEditingController get descController => _descController;
}
