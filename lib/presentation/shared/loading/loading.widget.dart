import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading.controller.dart';

class LoadingWidget extends GetWidget<LoadingController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading
          ? WillPopScope(
              onWillPop: () => Future.value(false),
              child: Stack(
                children: <Widget>[
                  ModalBarrier(
                    dismissible: false,
                    color: Colors.grey.withOpacity(.3),
                  ),
                  const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.grey),
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox();
    });
  }
}
