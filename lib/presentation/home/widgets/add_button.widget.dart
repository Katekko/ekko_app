import 'package:arctekko/common/utils/snackbar.util.dart';
import 'package:arctekko/infrastructure/navigation/routes.dart';
import 'package:arctekko/presentation/home/controllers/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddButtonWidget extends GetView<HomeController> {
  void onPressed() async {
    try {
      var result = await Get.toNamed(Routes.ADD_TODO);

      if (result != null) {
        await controller.addTodo(result['todo']);
      }
    } catch (err) {
      SnackbarUtil.showError(err.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(Icons.add),
    );
  }
}
