import 'package:arctekko/common/utils/snackbar.util.dart';
import 'package:arctekko/domain/todo/models/todo.model.dart';
import 'package:arctekko/presentation/add_todo/store/add_todo.store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveButtonWidget extends StatelessWidget {
  void onPressed() {
    AddTodoStore store = Get.find();

    var createdTodo = TodoModel(
      title: store.titleController.text,
      desc: store.descController.text,
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
