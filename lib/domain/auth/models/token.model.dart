import 'package:arctekko/domain/core/constants/storage.constants.dart';
import 'package:arctekko/domain/core/exceptions/invalid_token.exception.dart';
import 'package:arctekko/infrastructure/dal/services/auth/data/token.data.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TokenModel {
  String token;
  DateTime expiration;
  bool get isValid => expiration.isAfter(DateTime.now());

  TokenModel({@required this.token, @required this.expiration});

  factory TokenModel.fromData(TokenData data) {
    return TokenModel(token: data.token, expiration: data.expiration);
  }

  /// InvalidTokenException if token is not valid
  ///
  /// If is valid will save the token in storage
  /// together with token on GetConnect header
  void save() {
    try {
      if (isValid) {
        GetStorage storage = Get.find();
        storage.write(StorageConstants.TOKEN_AUTHORIZATION, token);
        var date = expiration.toString();
        storage.write(StorageConstants.TOKEN_EXPIRATION, date);

        // GetConnect connect = Get.find();
        // // TODO: Adicionar token no get connect
      } else {
        throw InvalidTokenException();
      }
    } catch (err) {
      rethrow;
    }
  }
}
