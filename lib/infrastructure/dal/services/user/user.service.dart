import 'package:arctekko/domain/core/exceptions/default.exception.dart';
import 'package:arctekko/infrastructure/dal/services/user/dto/get_user_info.response.dart';
import 'package:flutter/foundation.dart';

import '../base.service.dart';

class UserService {
  final BaseService _base;
  UserService({@required BaseService base}) : _base = base;

  Future<GetUserInfoResponse> getUserInfo() async {
    var response = await _base.get('user');

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
