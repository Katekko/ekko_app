import 'package:arctekko/presentation/shared/loading/base.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controllers/login.controller.dart';
import 'widgets/login_button.widget.dart';
import 'widgets/login_text_field.widget.dart';
import 'widgets/password_text_field.widget.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('EKKO APP', style: Get.textTheme.headline3),
              SizedBox(height: 50),
              LoginTextFieldWidget(),
              SizedBox(height: 10),
              PasswordTextFieldWidget(),
              SizedBox(height: 20),
              LoginButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
