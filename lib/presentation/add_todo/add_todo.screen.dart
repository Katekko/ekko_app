import 'package:arctekko/presentation/add_todo/store/add_todo.store.dart';
import 'package:arctekko/presentation/add_todo/widgets/text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/save_button.widget.dart';

class AddTodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AddTodoStore store = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Criando TODO'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
              hintText: 'Titulo',
              controller: store.titleController,
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              hintText: 'Descrição',
              controller: store.descController,
            ),
            SizedBox(height: 20),
            SaveButtonWidget(),
          ],
        ),
      ),
    );
  }
}
