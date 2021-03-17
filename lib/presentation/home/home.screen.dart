import 'package:ekko/presentation/shared/loading/base.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('HomeScreen'),
          centerTitle: true,
        ),
        body: Center(
          child: Obx(
            () => Text(
              'Logado com: ${controller.user.value?.name ?? 'Ops'}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
