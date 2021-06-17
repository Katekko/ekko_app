import 'package:ekko/domain/core/utils/snackbar.util.dart';
import 'package:ekko/infrastructure/navigation/bindings/domains/auth.repository.binding.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';

import 'config.dart';
import 'domain/core/constants/storage.constants.dart';
import 'infrastructure/navigation/routes.dart';

import 'presentation/shared/loading/loading.controller.dart';

class Initializer {
  static Future<void> init() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await _initStorage();
      _initGetConnect();
      _initGlobalLoading();
      _initScreenPreference();
    } catch (err) {
      rethrow;
    }
  }

  static Future<void> _initGetConnect() async {
    final connect = GetConnect();
    final url = ConfigEnvironments.getEnvironments()['url'];
    connect.baseUrl = url;
    connect.timeout = const Duration(seconds: 20);
    connect.httpClient.maxAuthRetries = 0;

    connect.httpClient.addRequestModifier<dynamic>(
      (request) {
        final storage = Get.find<GetStorage>();
        final token = storage.read(StorageConstants.TOKEN_AUTHORIZATION);
        if (token != null) {
          request.headers['Authorization'] = 'Bearer $token';
        }
        return request;
      },
    );

    connect.httpClient.addResponseModifier(
      (request, response) async {
        if (response.statusCode == 401) {
          final authDomainBinding = AuthRepositoryBinding();
          await authDomainBinding.repository.logoutUser();
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
    final loading = LoadingController();
    Get.put(loading);
  }

  static Future<void> _initStorage() async {
    await GetStorage.init();
    Get.put(GetStorage());
  }

  static void _initScreenPreference() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
