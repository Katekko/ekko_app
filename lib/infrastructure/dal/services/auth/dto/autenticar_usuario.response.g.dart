// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autenticar_usuario.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutenticarUsuarioResponse _$AutenticarUsuarioResponseFromJson(
    Map<String, dynamic> json) {
  return AutenticarUsuarioResponse(
    id: json['id'] as int,
    name: json['name'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$AutenticarUsuarioResponseToJson(
        AutenticarUsuarioResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'token': instance.token,
    };
