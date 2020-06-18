import 'package:arctekko/presentation/home/widgets/todo_list.widget.dart';
import 'package:flutter/material.dart';

import 'widgets/add_button.widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vamos adicionar TODO\'s?'),
      ),
      body: TodoListWidget(),
      floatingActionButton: AddButtonWidget(),
    );
  }
}
