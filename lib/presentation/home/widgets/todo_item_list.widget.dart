import 'package:arctekko/domain/todo/models/todo.model.dart';
import 'package:flutter/material.dart';

class TodoItemListWidget extends StatelessWidget {
  final TodoModel todo;
  TodoItemListWidget({@required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
