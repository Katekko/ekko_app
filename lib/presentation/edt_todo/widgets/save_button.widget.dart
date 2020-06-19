import 'package:arctekko/presentation/edt_todo/store/edt_todo.store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveButtonWidget extends StatelessWidget {
  void onPressed() {
    EdtTodoStore store = Get.find();

    store.todo.title = store.titleController.text;
    store.todo.desc = store.descController.text;

    Get.back(result: {'todo': store.todo});
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
