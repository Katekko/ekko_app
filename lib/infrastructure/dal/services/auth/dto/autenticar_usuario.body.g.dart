// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autenticar_usuario.body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutenticarUsuarioBody _$AutenticarUsuarioBodyFromJson(
    Map<String, dynamic> json) {
  return AutenticarUsuarioBody(
    login: json['login'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$AutenticarUsuarioBodyToJson(
        AutenticarUsuarioBody instance) =>
    <String, dynamic>{
      'login': instance.login,
      'password': instance.password,
    };
