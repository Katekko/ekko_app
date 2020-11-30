import 'package:arctekko/infrastructure/dal/daos/user.dao.dart';
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
      await _initStorage();
      _initGetConnect();
      _initGlobalLoading();
      _initScreenPreference();
      await _initHive();
    } catch (err) {
      rethrow;
    }
  }

  static void _initGetConnect() async {
    var connect = GetConnect();
    var url = ConfigEnvironments.getEnvironments()['url'];
    connect.baseUrl = url;
    connect.timeout = Duration(seconds: 10);
    connect.httpClient.maxAuthRetries = 3;
    connect.httpClient.addAuthenticator((request) async {
      // TODO: Adicionar refresh token, caso falhar deslogar usuario
      return request;
    });

    Logger().i('Conectado em: $url');
    Get.put(connect);
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
