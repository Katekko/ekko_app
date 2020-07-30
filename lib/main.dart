import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import 'common/widgets/loading/loading.controller.dart';
import 'config.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'infrastructure/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  var dio = Dio();
  var url = ConfigEnvironments.getEnvironments()['url'];
  dio.options.baseUrl = url;
  Logger().i('Conectado em: $url');
  Get.put(dio);

  var loading = LoadingController();
  Get.put(loading);

  await GetStorage.init();
  var dir = await getApplicationDocumentsDirectory();
  Hive..init(dir.path);

  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: initialRoute,
      getPages: Nav.routes,
      theme: themeData,
    );
  }
}
