import 'package:arctekko/common/widgets/text_field.widget.dart';
import 'package:arctekko/presentation/edt_todo/controllers/edt_todo.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/save_button.widget.dart';

class EdtTodoScreen extends GetView<EdtTodoController> {
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
              controller: controller.titleController,
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              hintText: 'Descrição',
              controller: controller.descController,
            ),
            SizedBox(height: 20),
            SaveButtonWidget(),
          ],
        ),
      ),
    );
  }
}
