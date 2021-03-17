import 'package:ekko/domain/core/exceptions/default.exception.dart';
import 'package:ekko/infrastructure/dal/services/user/dto/get_user_info.response.dart';

import 'package:get/get.dart';

class UserService {
  final GetConnect _connect;
  const UserService({required GetConnect connect}) : _connect = connect;

  String get _prefix => 'user';

  Future<GetUserInfoResponse> getUserInfo() async {
    final response = await _connect.get(
      _prefix,
      decoder: (value) => GetUserInfoResponse.fromJson(
        value as Map<String, dynamic>,
      ),
    );

    if (!response.hasError) {
      return response.body!;
    } else {
      switch (response.statusCode) {
        default:
          throw DefaultException(message: response.body!.error!);
      }
    }
  }
}
