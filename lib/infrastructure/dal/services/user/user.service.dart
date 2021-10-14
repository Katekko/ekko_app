import 'package:ekko/domain/core/abstractions/http_connect.interface.dart';
import 'package:ekko/domain/core/exceptions/default.exception.dart';
import 'package:ekko/infrastructure/dal/services/user/dto/get_user_info.response.dart';

class UserService {
  final IHttpConnect _connect;
  const UserService(IHttpConnect connect) : _connect = connect;

  String get _prefix => 'user';

  Future<GetUserInfoResponse> getUserInfo() async {
    final response = await _connect.get(
      _prefix,
      decoder: (value) => GetUserInfoResponse.fromJson(
        value as Map<String, dynamic>,
      ),
    );

    if (response.success) {
      return response.payload!;
    } else {
      switch (response.statusCode) {
        default:
          throw DefaultException(message: response.payload!.error!);
      }
    }
  }
}
