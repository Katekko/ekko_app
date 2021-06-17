import 'package:ekko/domain/core/exceptions/default.exception.dart';
import 'package:ekko/domain/core/exceptions/user_not_found.exception.dart';
import 'package:ekko/infrastructure/translate/login.translate.dart';
import 'package:get/get.dart';

import 'package:get/get_connect/connect.dart';

import 'dto/authenticate_user.body.dart';
import 'dto/authenticate_user.response.dart';

class AuthService {
  final _connect = Get.find<GetConnect>();
  String get _prefix => 'auth';

  Future<AuthenticateUserResponse> authenticateUser(
    AuthenticateUserBody body,
  ) async {
    final response = await _connect.post(
      '$_prefix/login',
      body.toJson(),
      decoder: (value) => AuthenticateUserResponse.fromJson(
        value as Map<String, dynamic>,
      ),
    );

    if (!response.hasError) {
      return response.body!;
    } else {
      switch (response.statusCode) {
        case 404:
          throw UserNotFoundException(
            message: LoginTranslate.userPasswordWrongSnackbar,
          );
        default:
          throw DefaultException(message: response.body!.error!);
      }
    }
  }
}
