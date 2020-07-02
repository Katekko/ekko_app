import 'package:arctekko/domain/todo/models/category.model.dart';
import 'package:arctekko/presentation/add_todo/controllers/add_todo.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDropdownWidget extends GetView<AddTodoController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      builder: (_) {
        var items = List.generate(
          controller.categories.length,
          (index) => DropdownMenuItem<CategoryModel>(
            value: controller.categories[index],
            child: Text('${controller.categories[index].name}'),
          ),
        );

        return DropdownButton<CategoryModel>(
          isExpanded: true,
          value: controller.currentCategory,
          onChanged: controller.onChangeCategory,
          items: items,
        );
      },
    );
  }
}
