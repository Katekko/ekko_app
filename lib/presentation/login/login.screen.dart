import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infrastructure/translate/login.translate.dart';
import './controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${LoginTranslate.appBar}'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LoginScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
