import 'package:ekko/domain/core/constants/storage.constants.dart';
import 'package:ekko/infrastructure/dal/services/auth/data/token.data.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TokenModel {
  final String token;
  const TokenModel({required this.token});

  factory TokenModel.fromData(TokenData data) {
    return TokenModel(token: data.token);
  }

  Future<void> save() async {
    try {
      final storage = Get.find<GetStorage>();
      await storage.write(StorageConstants.TOKEN_AUTHORIZATION, token);

      final connect = Get.find<GetConnect>();
      connect.httpClient.addRequestModifier<dynamic>(
        (request) {
          request.headers['Authorization'] = 'Bearer $token';
          return request;
        },
      );

      Get.put(connect);
    } catch (err) {
      rethrow;
    }
  }
}
