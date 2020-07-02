import 'package:arctekko/common/widgets/text_field.widget.dart';
import 'package:arctekko/presentation/add_todo/controllers/add_todo.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/category_dropdown.widget.dart';
import 'widgets/save_button.widget.dart';

class AddTodoScreen extends GetView<AddTodoController> {
  @override
  Widget build(BuildContext context) {
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
              onChange: controller.onChangeTitle,
            ),
            SizedBox(height: 20),
            TextFieldWidget(
              hintText: 'Descrição',
              onChange: controller.onChangeDescription,
            ),
            SizedBox(height: 50),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Category:'),
                CategoryDropdownWidget(),
              ],
            ),
            SizedBox(height: 20),
            SaveButtonWidget(),
          ],
        ),
      ),
    );
  }
}
