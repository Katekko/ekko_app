import 'package:arctekko/presentation/home/controllers/home.controller.dart';
import 'package:arctekko/presentation/home/widgets/todo_item_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (controller) => controller.todoList.value.isNotEmpty
          ? ListView.builder(
              padding: EdgeInsets.all(30),
              itemCount: controller.todoList.length,
              itemBuilder: (_, index) => Padding(
                padding: EdgeInsets.only(bottom: 19),
                child: TodoItemListWidget(
                  todo: controller.todoList[index],
                ),
              ),
            )
          : Center(
              child: Text('Não existe TODO\'s'),
            ),
    );
  }
}
