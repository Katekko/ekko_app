import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'autenticar_usuario.response.g.dart';

@JsonSerializable()
class AutenticarUsuarioResponse {
  int id;
  String name, token;

  AutenticarUsuarioResponse({
    @required this.id,
    @required this.name,
    @required this.token,
  });

  factory AutenticarUsuarioResponse.fromJson(Map<String, dynamic> json) =>
      _$AutenticarUsuarioResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AutenticarUsuarioResponseToJson(this);
}
