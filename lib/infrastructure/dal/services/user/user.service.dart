import 'package:arctekko/domain/core/exceptions/default.exception.dart';
import 'package:arctekko/infrastructure/dal/services/user/dto/get_user_info.response.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class UserService {
  final GetConnect _connect;
  UserService({@required GetConnect connect}) : _connect = connect;

  Future<GetUserInfoResponse> getUserInfo() async {
    var response = await _connect.get('user');

    if (!response.hasError) {
      var model = GetUserInfoResponse.fromJson(response.body);
      return model;
    } else {
      switch (response.statusCode) {
        default:
          throw DefaultException(message: response.statusText);
      }
    }
  }
}
