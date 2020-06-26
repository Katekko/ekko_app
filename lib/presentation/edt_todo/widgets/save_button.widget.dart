import 'package:arctekko/presentation/edt_todo/controllers/edt_todo.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveButtonWidget extends GetView<EdtTodoController> {
  void onPressed() {
    Get.back(result: {'todo': controller.todo});
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
