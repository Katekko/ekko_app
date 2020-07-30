import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'autenticar_usuario.body.g.dart';

@JsonSerializable()
class AutenticarUsuarioBody {
  String login;
  String password;

  AutenticarUsuarioBody({
    @required String login,
    @required String password,
  }) {
    this.login = login.trim();
    this.password = password.trim();
  }

  factory AutenticarUsuarioBody.fromJson(Map<String, dynamic> json) =>
      _$AutenticarUsuarioBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AutenticarUsuarioBodyToJson(this);
}
