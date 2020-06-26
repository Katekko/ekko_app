import 'package:arctekko/common/utils/snackbar.util.dart';
import 'package:arctekko/common/widgets/confirm_dialog.widget.dart';
import 'package:arctekko/domain/todo/models/todo.model.dart';
import 'package:arctekko/infrastructure/navigation/routes.dart';
import 'package:arctekko/presentation/home/controllers/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoItemListWidget extends GetView<HomeController> {
  final TodoModel todo;
  TodoItemListWidget({@required this.todo});

  void onLongPressTodo() async {
    try {
      var result = await Get.dialog(ConfirmDialogWidget(
        title: 'Delete Todo?',
        desc: 'Wanna delete this todo?',
      ));
      if (result != null && result) {
        await controller.removeTodo(todo);
      }
    } catch (err) {
      SnackbarUtil.showError(err.message);
    }
  }

  void onDoubleTapTodo() async {
    try {
      var result = await Get.toNamed(
        Routes.EDT_TODO,
        arguments: {'todo': todo},
      );

      if (result != null) {
        var editedTodo = result['todo'] as TodoModel;
        await controller.editeTodo(editedTodo);
      }
    } catch (err) {
      SnackbarUtil.showError(err.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onLongPress: onLongPressTodo,
        onDoubleTap: onDoubleTapTodo,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${todo.title}',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 10),
              Text(
                '${todo.desc}',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
