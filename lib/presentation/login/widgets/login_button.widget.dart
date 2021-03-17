import 'package:ekko/presentation/login/controllers/login.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButtonWidget extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: controller.enableButton ? controller.doLogin : null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Get.theme?.primaryColor),
      ),
      child: const SizedBox(
        height: 60,
        width: double.infinity,
        child: Center(
          child: Text(
            'ENTER',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
