import 'package:arctekko/presentation/home/store/home.store.dart';
import 'package:arctekko/presentation/home/widgets/todo_item_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoListWidget extends StatelessWidget {
  final HomeStore _store = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetX(
      builder: (_) => _store.todoList.value.isNotEmpty
          ? ListView.builder(
              padding: EdgeInsets.all(30),
              itemCount: _store.todoList.length,
              itemBuilder: (_, index) => Padding(
                padding: EdgeInsets.only(bottom: 19),
                child: TodoItemListWidget(
                  todo: _store.todoList[index],
                ),
              ),
            )
          : Center(
              child: Text('Não existe TODO\'s'),
            ),
    );
  }
}
