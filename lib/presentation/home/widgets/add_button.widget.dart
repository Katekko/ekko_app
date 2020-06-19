import 'package:arctekko/common/utils/snackbar.util.dart';
import 'package:arctekko/infrastructure/navigation/routes.dart';
import 'package:arctekko/presentation/home/store/home.store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddButtonWidget extends StatelessWidget {
  void onPressed() async {
    try {
      HomeStore store = Get.find();
      var result = await Get.toNamed(Routes.ADD_TODO);

      if (result != null) {
        await store.addTodo(result['todo']);
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
