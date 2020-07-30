import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authenticate_user.body.g.dart';

@JsonSerializable()
class AuthenticateUserBody {
  String login;
  String password;

  AuthenticateUserBody({
    @required String login,
    @required String password,
  }) {
    this.login = login.trim();
    this.password = password.trim();
  }

  factory AuthenticateUserBody.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateUserBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateUserBodyToJson(this);
}
