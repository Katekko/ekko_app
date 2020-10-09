import 'package:arctekko/infrastructure/dal/daos/user.dao.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

import 'config.dart';
import 'presentation/shared/loading/loading.controller.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      _initDio();
      _initGlobalLoading();
      _initScreenPreference();
      await _initStorage();
      await _initHive();
    } catch (err) {
      rethrow;
    }
  }

  static void _initDio() async {
    var dio = Dio();
    var url = ConfigEnvironments.getEnvironments()['url'];
    dio.options.baseUrl = url;
    dio.options.sendTimeout = 10000;
    Logger().i('Conectado em: $url');
    Get.put(dio);
  }

  static void _initGlobalLoading() {
    var loading = LoadingController();
    Get.put(loading);
  }

  static Future<void> _initStorage() async {
    await GetStorage.init();
    Get.put(GetStorage());
  }

  static Future<void> _initHive() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive
      ..init(dir.path)
      ..registerAdapter(UserDaoAdapter());
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
