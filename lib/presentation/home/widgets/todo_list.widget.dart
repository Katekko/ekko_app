import 'package:arctekko/presentation/home/store/home.store.dart';
import 'package:arctekko/presentation/home/widgets/todo_item_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeStore>(
      builder: (store) => store.todoList.value.isNotEmpty
          ? ListView.builder(
              padding: EdgeInsets.all(30),
              itemCount: store.todoList.length,
              itemBuilder: (_, index) => Padding(
                padding: EdgeInsets.only(bottom: 19),
                child: TodoItemListWidget(
                  todo: store.todoList[index],
                ),
              ),
            )
          : Center(
              child: Text('Não existe TODO\'s'),
            ),
    );
  }
}
