import 'package:arctekko/presentation/shared/loading/base.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../infrastructure/translate/login.translate.dart';
import './controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${LoginTranslate.appBar}'),
          centerTitle: true,
        ),
        body: Center(
          child: Obx(
            () => Text(
              '${controller.user?.value?.name ?? 'LoginScreen is working'}',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
