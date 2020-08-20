import 'package:arctekko/infrastructure/translate/login.translate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:arctekko/presentation/login/controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LoginTranslate.appBar),
      ),
    );
  }
}
