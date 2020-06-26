import 'package:arctekko/domain/todo/models/todo.model.dart';
import 'package:arctekko/presentation/add_todo/controllers/add_todo.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveButtonWidget extends GetView<AddTodoController> {
  void onPressed() {
    var createdTodo = TodoModel(
      title: controller.titleController.text,
      desc: controller.descController.text,
    );

    Get.back(result: {'todo': createdTodo});
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: Colors.green,
      child: Text(
        'Save',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
