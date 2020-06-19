import 'package:arctekko/common/widgets/text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'store/edt_todo.store.dart';
import 'widgets/save_button.widget.dart';

class EdtTodoScreen extends StatelessWidget {
  final EdtTodoStore _store = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editando TODO'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
              hintText: 'Titulo',
              controller: _store.titleController,
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              hintText: 'Descrição',
              controller: _store.descController,
            ),
            SizedBox(height: 20),
            SaveButtonWidget(),
          ],
        ),
      ),
    );
  }
}
