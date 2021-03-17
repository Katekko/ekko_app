import 'package:ekko/domain/core/utils/snackbar.util.dart';
import 'package:ekko/infrastructure/navigation/bindings/domains/auth.domain.binding.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import 'config.dart';
import 'infrastructure/navigation/routes.dart';
import 'objectbox.g.dart';
import 'presentation/shared/loading/loading.controller.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await _initStorage();
      _initGetConnect();
      _initGlobalLoading();
      _initScreenPreference();
      await _initObjectBox();
    } catch (err) {
      rethrow;
    }
  }

  static void _initGetConnect() async {
    var connect = GetConnect();
    var url = ConfigEnvironments.getEnvironments()['url'];
    connect.baseUrl = url;
    connect.timeout = Duration(seconds: 20);
    connect.httpClient.maxAuthRetries = 0;

    connect.httpClient.addResponseModifier(
      (request, response) async {
        if (response.statusCode == 401) {
          var authDomainBinding = AuthDomainBinding();
          await authDomainBinding.domain!.logoutUser();
          Get.offAllNamed(Routes.LOGIN);
          SnackbarUtil.showWarning(
            message: 'Faça login novamente para continuar utilizando o sistema',
          );
        }
      },
    );

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

  static Future<void> _initObjectBox() async {
    try {
      var dir = await getApplicationDocumentsDirectory();
      var store = Store(
        getObjectBoxModel(),
        directory: dir.path + '/objectbox',
      );
      Get.put(store);
    } catch (err) {
      rethrow;
    }
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
