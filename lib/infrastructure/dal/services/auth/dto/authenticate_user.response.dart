import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authenticate_user.response.g.dart';

@JsonSerializable()
class AuthenticateUserResponse {
  int id;
  String name, token;

  AuthenticateUserResponse({
    @required this.id,
    @required this.name,
    @required this.token,
  });

  factory AuthenticateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateUserResponseToJson(this);
}
