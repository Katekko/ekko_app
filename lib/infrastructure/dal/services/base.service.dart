import 'package:arctekko/domain/auth/models/token.model.dart';
import 'package:arctekko/domain/core/constants/storage.constants.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get_storage/get_storage.dart';

class BaseService {
  final GetConnect _connect;
  final GetStorage _storage;
  const BaseService({
    @required GetConnect connect,
    @required GetStorage storage,
  })  : _connect = connect,
        _storage = storage;

  String get token {
    if (_storage.hasData(StorageConstants.TOKEN_AUTHORIZATION) &&
        _storage.hasData(StorageConstants.TOKEN_EXPIRATION)) {
      var token = _storage.read(StorageConstants.TOKEN_AUTHORIZATION);
      var expiration = _storage.read(StorageConstants.TOKEN_EXPIRATION);
      var date = DateTime.parse(expiration);
      var tokenModel = TokenModel(token: token, expiration: date);
      if (tokenModel.isValid) {
        return token;
      }
    }

    return null;
  }

  // TODO: Temporario, proxima atualizaçao será possivel colocar
  // um header global para o get connect
  Future<Response<dynamic>> get(String path) async {
    var response = await _connect.get(
      path,
      headers: {'Authorization': 'Bearer $token'},
    );

    return response;
  }

  Future<Response<dynamic>> post(
    String path, {
    Map<String, dynamic> body,
  }) async {
    var response = await _connect.post(
      path,
      body,
      headers: {'Authorization': 'Bearer $token'},
    );

    return response;
  }
}
