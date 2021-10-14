// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate_user.body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticateUserBody _$AuthenticateUserBodyFromJson(
        Map<String, dynamic> json) =>
    AuthenticateUserBody(
      login: json['login'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthenticateUserBodyToJson(
        AuthenticateUserBody instance) =>
    <String, dynamic>{
      'login': instance.login,
      'password': instance.password,
    };
